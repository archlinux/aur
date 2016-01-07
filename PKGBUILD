# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-buildozer
pkgver=0.31
pkgrel=1
pkgdesc="Generic Python packager for Android / iOS and Desktop"
arch=('any')
depends=('python2' 'python2-colorama' 'python2-pexpect' 'python2-virtualenv')
makedepends=('cmake' 'libusb' 'python2-setuptools')
optdepends=('python2-paramiko: remote builds')
url="https://github.com/kivy/buildozer"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('76a7e63a0aaedbe5f449628c8ae6b530')
sha256sums=('7ef8a3be5362fc3e047cdeeaff46954ab667b9ae12023a525ed04ea3e697e41f')
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
