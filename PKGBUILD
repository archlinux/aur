# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=CadenFinley
_appname=CJsShell
_execname=cjsh
pkgname=${_execname}-bin
pkgdesc="POSIX shell scripting meets Modern Shell Features"

pkgver=1.4.9
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
sha256sums=('367d9ed3680b512bba69cb0e304cca757b76e31285b5275cb183d27ac8b91117'
            '74a18f58fbe303be1a37ad3b5ec144f88c2ba99b9a43ea022afb75594bc66c21'
            '04c7dcb28cedcc7f32bcdfcdcb90b390538202fb3fc8fc222eea3c1357e756f6'
            '8522a384a493df7a4066e28a039a4e789a55a3f070dcf8ae097436f3754653c4'
            '538ef8557566472c911cbb3402730683dec9ccddcc70a52b7b80d32dbe8c83c5'
            '60a2377bd4917712d11a61addd67460fe4410dae562a701bc4921077de7451b8'
            '5bc433042212436482823d29c6d537068f7c4de7633745acb3777751d28a3f1a'
            '82e8b8ed243f679fdf0950ce81c796d67db0e5e3c8a10a92017f8fe9e420c321')
sha256sums_x86_64=('8a36d1693e8e8d0c30374f43d38bcccd970a336aabb3df2d9f9f628b1c5ea54f')
sha256sums_aarch64=('d39d7cb119fdee1f65a1274ea93dad3904612718fdd89465f2713272a841bc18')


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
