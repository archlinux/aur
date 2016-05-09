# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-buildozer
pkgver=0.32
pkgrel=1
pkgdesc="Generic Python packager for Android / iOS and Desktop"
arch=('any')
depends=('python2' 'python2-colorama' 'python2-pexpect' 'python2-virtualenv')
makedepends=('cmake' 'libusb' 'python2-setuptools')
optdepends=('python2-paramiko: remote builds')
url="https://github.com/kivy/buildozer"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/62/a4/fab757fd32c020b41626af656f6f848d8d8a1b9eeb4d29967b6aef998857/buildozer-0.32.tar.gz)
md5sums=('1476976728af21346f39b3c24edbd363')
sha256sums=('73aa4704f369cf4b6df32bda78a1a5fbdbfaeef609b9ad6a1e2c5bce4deded36')
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
