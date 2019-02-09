# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Contributor: tafli
# Contributor: maat

pkgname=brickv
pkgver=2.3.17
pkgrel=1
pkgdesc="testing/flashing tool for tinkerforge brick(let)s"
url="http://www.tinkerforge.com/"
license=("GPL2")
arch=('i686' 'x86_64' 'armv7h')
depends=('pyqwt' 'python2-pyserial' 'brickd' 'python-pyqt4' 'python2-setuptools' 'python2-opengl' 'python2-sip-pyqt4')
optdepends=('brickd')
source=(https://github.com/Tinkerforge/${pkgname}/archive/v${pkgver}.zip)
md5sums=('4673a7318af783f01e65dbc81e3bc0d3')

build() {
  cd $srcdir/$pkgname-$pkgver/src/
  find . -type f -name '*py' -exec sed -i 's%/usr/bin/env python$%&2%' '{}' \;
  find . -type f -exec sed -i 's%pyuic4%python2-&%' '{}' \;
  find . -type f -exec sed -i "s%system(\(['\"]\)python %system(\1python2 %" '{}' \;
  python2 build_all_ui.py
}

package() {
  cd $srcdir/$pkgname-$pkgver/src/
  python2 setup.py install --root=$pkgdir --prefix=/usr
}
