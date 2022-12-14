# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Co-Maintainer: Erik Fleckstein <erik at tinkerforge dot com>
# Contributor: tafli
# Contributor: maat

pkgname=brickv
pkgver=2.4.23
pkgrel=1
pkgdesc="testing/flashing tool for tinkerforge brick(let)s"
url="http://www.tinkerforge.com/"
license=("GPL2")
arch=('any')
depends=('python-pyserial' 'python-pyqt5' 'python-pytz' 'python-tzlocal')
optdepends=('brickd: local device support')
makedepends=('python-setuptools')
source=(https://github.com/Tinkerforge/${pkgname}/archive/v${pkgver}.zip)
sha256sums=('9bf9d29db06b8c1274d6566fac5cbd02fa62edda3ad9255ebe33e77c1eaa59b2')

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
