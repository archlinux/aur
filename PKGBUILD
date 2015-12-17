# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=brickv
pkgver=2.3.2
pkgrel=1
pkgdesc="brick viewer is a testing/flashing tool for tinkerforge brick(let)s"
url="http://www.tinkerforge.com/"
license=("GPL2")
arch=('i686' 'x86_64' 'armv7h')
depends=('pyqwt' 'python2-pyserial' 'brickd' 'python-pyqt4' 'python2-setuptools')
optdepends=('brickd')
source=(https://github.com/Tinkerforge/${pkgname}/archive/v${pkgver}.zip)
md5sums=('684d323e194e849b2b245e43a4ab4cd8')

build() {
  cd $srcdir/$pkgname-$pkgver/src/
  find . -type f -name '*py' -exec sed -i 's%/usr/bin/env python%&2%' '{}' \;
  find . -type f -exec sed -i 's%pyuic4%python2-&%' '{}' \;
  find . -type f -exec sed -i 's%system("python %system("python2 %' '{}' \;
  python2 build_all_ui.py
}

package() {
  cd $srcdir/$pkgname-$pkgver/src/
  python2 setup.py install --root=$pkgdir --prefix=/usr
}
