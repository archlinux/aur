# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=CadenFinley
_appname=CJsShell
_execname=cjsh
pkgname=${_execname}-bin
pkgdesc="POSIX shell scripting meets Modern Shell Features"

pkgver=1.4.12
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
sha256sums=('17d4dbbab4b777cc738a1cabd6808503e68b53e254fc98866e76d78dbc81bfbc'
            '271ddb6d44b38c83cd2eb69739b74f18935a90638deb39a06ab299b265a93c88'
            'b80e45828e9355bbe931ab667d3126db730973f0aea76cf232424cdfbd1b2a0b'
            '010a5f51eb36c84154c9e3c192e679a378ab3bfac114cff6afe511e1ad8777d4'
            '538ef8557566472c911cbb3402730683dec9ccddcc70a52b7b80d32dbe8c83c5'
            '60a2377bd4917712d11a61addd67460fe4410dae562a701bc4921077de7451b8'
            '5bc433042212436482823d29c6d537068f7c4de7633745acb3777751d28a3f1a'
            '3889766b8eba4a461cc768c3f52000fe501b23adf99535c9f8fb1c8ccf8aebaf')
sha256sums_x86_64=('34349c9380baff830c938038db0fda476e0cbf45cf2c571543c755a9dd312a5e')
sha256sums_aarch64=('04bb01c92cbe89dce41f3041025040dfe8e00d23bb16232f36b04191c406eadd')


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
