# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-buildozer
pkgver=0.29
pkgrel=1
pkgdesc="Generic Python packager for Android / iOS and Desktop"
arch=('any')
depends=('python2' 'python2-colorama' 'python2-pexpect')
makedepends=('cmake' 'libusb' 'python2-setuptools')
optdepends=('python2-paramiko: remote builds')
url="https://github.com/kivy/buildozer"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('aa0fef392885b2b3d57b9b000a671f1d')
sha256sums=('82c8dabdc3122d9650ad7079d84a8cbd43f17e8291e1590547df9c693189d0b3')
provides=('buildozer' 'python2-buildozer')
conflicts=('buildozer')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Fixing Cython version...'
  find . -type f -print0 | xargs -0 sed -i 's#Cython#Cython2#g'
  find . -type f -print0 | xargs -0 sed -i 's#cython#cython2#g'

  msg2 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
