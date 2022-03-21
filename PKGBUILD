# Maintainer: Philipp Joram <mail AT phijor DOT me>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='python-axolotl-git'
_pkgname='python-axolotl'
pkgver=0.2.3.r2.gb8d1a2e
pkgrel=1
pkgdesc="Python port of libaxolotl"
url="https://github.com/tgalal/python-axolotl"
arch=('any')
license=('GPL')
depends=('python'
         'python-cryptography'
         'python-axolotl-curve25519'
         'python-protobuf')
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest')
provides=('python-axolotl')
conflicts=('python-axolotl')
source=('git+https://github.com/tgalal/python-axolotl')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname"
  py.test
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
