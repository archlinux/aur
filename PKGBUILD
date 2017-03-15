# Maintainer: Frantisek Fladung <ametisf@gmail.com>

_pkgname=dwc
pkgname=$_pkgname-git
pkgver=24.f163ca2
pkgrel=1
pkgdesc="dynamic wayland compositor"
url="https://github.com/ametisf/dwc"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'wld')
makedepends=('swc' 'tup')
source=("git+https://github.com/ametisf/dwc.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd $_pkgname
	echo "ENABLE_DEBUG=0" >> config.tup
	tup init
	tup upd
}

package() {
	cd $_pkgname
	mkdir -p $pkgdir/usr/{bin,lib/pkgconfig,share/dwc}
	install -m 755 dwc $pkgdir/usr/bin
	install -m 644 dwc.pc $pkgdir/usr/lib/pkgconfig
	install -m 644 dwc.xml $pkgdir/usr/share/dwc
}
