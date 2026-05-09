# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=juanibiapina
_gitname=sub
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Shell scripts with superpowers"

pkgver=2.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums=('d6957c8034a4a341d2359d6e5dac02466adb3ed5b882c0d54a68c5162d7da65d'
            '1aeb6c22f163e3fc68f4370e6c9a805f59238c29f9995f1a5d65e562d10ba174')
sha256sums_x86_64=('3aabfeedafc04748eff676c73aee10f0e42408cc58e1b5b7a860c022259057b8')

case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
