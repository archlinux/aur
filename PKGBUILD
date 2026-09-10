# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=CadenFinley
_appname=CJsShell
_execname=cjsh
pkgname=${_execname}-bin
pkgdesc="POSIX shell scripting meets Modern Shell Features"

pkgver=1.5.1
pkgrel=1
_appversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-gnu-x86_64' 'linux-gnu-arm64')

_ghurl="https://github.com/${_appauthor}/${_appname}"
_ghurlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/${_appversion}"
url=${_ghurl}

license=('MIT')

provides=("${_execname}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'libgcc' 'libstdc++')

options=('!strip')

install="${_execname}.install"

source=("WHAT-TO-KNOW-${pkgver}.md::${_ghurlraw}/docs/getting-started/what-to-know.md"
        "HOOKS-${pkgver}.md::${_ghurlraw}/docs/reference/hooks.md"
        "EDITING-${pkgver}.md::${_ghurlraw}/docs/reference/editing.md"
        "COMMANDS-${pkgver}.md::${_ghurlraw}/docs/reference/commands.md"
        "FEATURES-${pkgver}.md::${_ghurlraw}/docs/reference/features.md"
        "COMPLETIONS-${pkgver}.md::${_ghurlraw}/docs/reference/completions.md"
        "NON-POSIX-FEATURES-${pkgver}.md::${_ghurlraw}/docs/reference/non-posix-features.md"
        "LANGUAGE-COMPATIBILITY-${pkgver}.md::${_ghurlraw}/docs/reference/language-compatibility.md")
source_x86_64=("${_execname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_appversion}/${_execname}-${_appversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_execname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_appversion}/${_execname}-${_appversion}-${_barch[1]}.tar.gz")
sha256sums=('84b038b5206824c33602e290f76cceb8c29219177f97d179e42fbb67ad8d3dfd'
            '271ddb6d44b38c83cd2eb69739b74f18935a90638deb39a06ab299b265a93c88'
            '29ca988ac50d958f4c7c410e83a6bc2ed50326f8b5e7956aa5debb79f341afe4'
            'e2df7864bb673689e52f4624d321f6a9cce989994c2043fa114cf6a138677ba3'
            '70cebacf376afc786467528aa7d2c8cd6f284ebfb84afa1feb04b01e303ae81d'
            'b031f603808d5eadc37ed3139656c0ab5688bd57ff7163301b0f0ec58b18ab4e'
            'a44c280fb650ae4a29169a6be233264d7c175ae5243c65e372c85204cc0651bb'
            '3889766b8eba4a461cc768c3f52000fe501b23adf99535c9f8fb1c8ccf8aebaf')
sha256sums_x86_64=('291f47382c1082356ae55b7b2c06fa578370235208248df99321c110d2466cc3')
sha256sums_aarch64=('ed8910ad70eefbb2108d440dd18bbfb1e4188016433f723759657a4aa4edcf78')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_execname}-${_appversion}-${_CARCH}/" || exit

	install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "../HOOKS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/HOOKS.md"
	install -Dm644 "../EDITING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/EDITING.md"
	install -Dm644 "../COMMANDS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/COMMANDS.md"
	install -Dm644 "../FEATURES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/FEATURES.md"
	install -Dm644 "../COMPLETIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/COMPLETIONS.md"
	install -Dm644 "../WHAT-TO-KNOW-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/WHAT-TO-KNOW.md"
	install -Dm644 "../NON-POSIX-FEATURES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/NON-POSIX-FEATURES.md"
	install -Dm644 "../LANGUAGE-COMPATIBILITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/LANGUAGE-COMPATIBILITY.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
