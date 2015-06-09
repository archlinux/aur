# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-cube-client
pkgver=0.2.0
pkgrel=1
pkgdesc="A Python client for Cube: Time Series Data Collection & Analysis"
arch=('any')
depends=('python2' 'python2-requests')
makedepends=('python2-setuptools')
optdepends=('cube-git: Time series data collection & analysis')
url="https://github.com/tsileo/cube-client"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('db789558ee0ee1a6d5eeed1dc5e58196')
sha256sums=('55c397d335b9e20afa8cc0279f49e35d0e78780919e465c4d0e1dc30532ea10f')

prepare(){
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
