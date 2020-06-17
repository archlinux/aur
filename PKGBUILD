# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Roger Duran <rogerduran@gmail.com>

pkgname=python2-xcffib
pkgver=0.9.0
pkgrel=1
pkgdesc="Python drop in replacement for xpyb, an XCB python binding"
arch=('any')
url="https://pypi.python.org/pypi/xcffib"
license=('Apache')
depends=('python-six' 'python2-cffi' 'libxcb')
makedepends=('python2-setuptools' 'python2-cffi' 'python2-six' 'libxcb' 'haskell-xcffib')
checkdepends=('python-nose' 'xorg-server-xvfb' 'xorg-xeyes')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tych0/xcffib/archive/v$pkgver.tar.gz")
sha512sums=('1299ff124d5ecb91c9551fb583741901f0635d9b3685da0436a14ebfdfdcc5bdec558a457400a27a22ffe2b99649250b3ef74223f27f8ac3a267a69314b509fb')

build() {
  cd "$srcdir"/xcffib-$pkgver
  make xcffib GEN=xcffibgen CABAL=true
  python2 setup.py build
}

check() {
  cd "$srcdir"/xcffib-$pkgver
  xvfb-run nosetests3
}

package() {
  cd xcffib-$pkgver
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

