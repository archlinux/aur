# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pysha3
pkgver=1.0.2
pkgrel=1
pkgdesc="SHA-3 wrapper (keccak) for Python"
arch=('i686' 'x86_64' 'armv6')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/tiran/pysha3"
license=('PSFL')
options=(!emptydirs)
source=("https://github.com/tiran/pysha3/archive/${pkgver}.tar.gz")
md5sums=('8e705c4e0b3e6cf4d108a3c9d8a2ac3d')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
