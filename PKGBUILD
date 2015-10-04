# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-buildozer
pkgver=0.30
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
md5sums=('121bf058275bf1f45c2e8f08ca597d94')
sha256sums=('98c033d70959f2b2b6c6e290d3e30cfb5e5bdc92f5427d6d0cc7f9d3e922170e')
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
