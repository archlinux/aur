# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Co-Maintainer: Erik Fleckstein <erik at tinkerforge dot com>
# Contributor: tafli
# Contributor: maat

pkgname=brickv
pkgver=2.4.16
pkgrel=2
pkgdesc="testing/flashing tool for tinkerforge brick(let)s"
url="http://www.tinkerforge.com/"
license=("GPL2")
arch=('any')
depends=('python-pyserial' 'python-pyqt5' 'python-pytz' 'python-tzlocal')
optdepends=('brickd: local device support')
makedepends=('python-setuptools')
source=(https://github.com/Tinkerforge/${pkgname}/archive/v${pkgver}.zip)
sha256sums=('225757e7bcd8dc74c2a69a423c84248b99804ceec42ce15aae289d76db395d0c')

build() {
  cd $srcdir/$pkgname-$pkgver/src
  python build_src.py
}

package() {
  cd $srcdir/$pkgname-$pkgver/src
  python setup.py install --root=$pkgdir --prefix=/usr
  install -Dm755 $srcdir/$pkgname-$pkgver/src/build_data/linux/brickv/usr/share/applications/brickv.desktop $pkgdir/usr/share/applications/brickv.desktop
  install -Dm644 $srcdir/$pkgname-$pkgver/src/build_data/linux/brickv/usr/share/pixmaps/brickv-icon.png $pkgdir/usr/share/pixmaps/brickv-icon.png
  install -Dm644 $srcdir/$pkgname-$pkgver/src/build_data/linux/brickv/lib/udev/rules.d/99-tinkerforge-brickv.rules $pkgdir/usr/lib/udev/rules.d/99-tinkerforge-brickv.rules
}
