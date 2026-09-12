# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=CadenFinley
_appname=CJsShell
_execname=cjsh
pkgname=${_execname}-bin
pkgdesc="POSIX shell scripting meets Modern Shell Features"

pkgver=1.5.5
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
sha256sums=('b57592e2605f319ba200df6ee9b0d851ed7aaea0723a7d29e21a6b0ff03b6854'
            '271ddb6d44b38c83cd2eb69739b74f18935a90638deb39a06ab299b265a93c88'
            '1085ae40157e900b98060b1d8854c59cb40de13ffb7b221764770d64e2ae8452'
            'fd565ad8840db0a34433ae7eb7f8db30b41b7c8621e3f335bc9aa6bf6f1ef013'
            '5d9281667facf2c078280c3d3532bdd6793dd89865e44d3d5b5217df61fa6dce'
            'c6fe360a8b01da454451e5e8e60d8400013729f25a7034e903f397b90867d5d3'
            'a44c280fb650ae4a29169a6be233264d7c175ae5243c65e372c85204cc0651bb'
            '79b60b9d612285418c27bea23f09a5d0cd11620d791d34cc2aec8749c3dc681b')
sha256sums_x86_64=('f88b879f21ba09f5c3b0415a1692afc43e42f67a539ce2e091619ffc3ac7e5d4')
sha256sums_aarch64=('797fdbd07f3ce7d528e661d0e270ece7c44e0f7e84d148e881af3e13e4f401f8')


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
