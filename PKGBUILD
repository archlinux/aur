# Maintainer: Antony Jordan <antony.r.jorda at gmail dot com>
pkgname=nanovna-saver
pkgver=0.2.1
pkgrel=1
pkgdesc="PC control for the NanoVNA."
arch=(any)
url="https://github.com/mihtjel/nanovna-saver"
license=('GPL3')
depends=(python-pyqt5 python-scipy python-numpy python-pyserial)
makedepends=(python-setuptools)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/mihtjel/nanovna-saver/archive/v$pkgver.tar.gz"
  "$pkgname.desktop"
)
md5sums=('abd4c72bf04a4fdf0ad06d1676643032'
         '7905a0edb1bfa830d677aa79a6133229')

build() {
	cd "$pkgname-$pkgver"
	python ./setup.py build
}

package() {
	cd "$pkgname-$pkgver"
    python ./setup.py install --prefix=/usr --root="$pkgdir"
    mkdir -p "$pkgdir/usr/share/pixmaps"
    cp icon_48x48.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    mkdir -p "$pkgdir/usr/share/applications"
    cd ..
    cp $pkgname.desktop "$pkgdir/usr/share/applications"
}

