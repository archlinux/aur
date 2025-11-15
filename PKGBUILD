# Maintainer: raprism <ra.prism@gmail.com>

_reposite=codeberg.org
_repouser=gwh
_repoproj=x50ng
_pkgtagname=2.5.0
_repourl=https://${_reposite}/${_repouser}/${_repoproj}
_repoarchive=${_pkgtagname}.tar.gz
_repourlarchive=${_repourl}/archive/${_repoarchive}
#_archivefile=${_repoproj}-${_repoarchive}

pkgname=${_repoproj}
pkgver=${_pkgtagname}
pkgrel=1
pkgdesc='HP 50g hardware level emulator'
arch=('any')
url=${_repourl}
license=('GPL2')
depends=('gtk4' 'lua' 'ncurses')
makedepends=('scdoc')
options=('!lto' '!debug')
install="${pkgname}.install"
source=("${_repourlarchive}")
sha256sums=('8567a8debbd694eeb875cc7a45478ff3788fd6f5b80315587f19ce8f9121673f')

build() {
	cd "${_repoproj}"
	make distclean && make INSTALL_PREFIX=/usr
}

package() {
	cd "${_repoproj}"
        make DESTDIR="${pkgdir}/" DOCDIR=/usr/share/doc/${pkgname} install
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
