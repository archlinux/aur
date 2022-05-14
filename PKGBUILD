# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=hpex-git
pkgver=1.0.0.r19.67c190f
pkgrel=1
pkgdesc='RPL HP calculator transfer tool with graphical and command line interfaces'
arch=('x86_64')
url='https://github.com/liamhays/hpex'
license=('GPL3')
depends=('ckermit' 'python' 'python-wxpython' 'python-xmodem' 'python-pypubsub' 'python-ptyprocess' 'python-pyserial')
makedepends=('git' 'python-setuptools')
provides=('hpex')
source=('git+https://github.com/liamhays/hpex.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
