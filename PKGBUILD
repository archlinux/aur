# Maintainer: raprism <ra.prism@gmail.com>

_reposite=codeberg.org
_repouser=gwh
_repoproj=x50ng
_pkgtagname=2.3.5
_repourl=https://${_reposite}/${_repouser}/${_repoproj}
_repoarchive=${_pkgtagname}.tar.gz
_repourlarchive=${_repourl}/archive/${_repoarchive}
#_archivefile=${_repoproj}-${_repoarchive}

pkgname=${_repoproj}
pkgver=${_pkgtagname}
pkgrel=2
pkgdesc='HP 50g hardware level emulator'
arch=('any')
url=${_repourl}
license=('GPL2')
depends=('gtk4' 'lua')
makedepends=('scdoc')
options=('!lto' '!debug')
install="${pkgname}.install"
source=("${_repourlarchive}")
sha256sums=('c46d6a856227c99940d6fc4d0846cc0a482f630d2a6d9c1d48a5aa010ea91141')

build() {
	cd "${_repoproj}"
	make distclean && make INSTALL_PREFIX=/usr
}

package() {
	cd "${_repoproj}"
        make DESTDIR="${pkgdir}/" DOCDIR=/usr/share/doc/${pkgname} install
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
