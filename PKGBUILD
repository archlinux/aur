# Maintainer: mzr <'mzr4141' at the domain 'gmail' dot 'com'>
pkgname=python-cint-git
pkgver=r48.db993da
pkgrel=1
pkgdesc='Wrapper for ctypes.c_* types so that the arithmetic operators works the same as in C.'
url='https://github.com/disconnect3d/cint'
arch=('any')
license=('MIT')
makedepends=('git' 'python-setuptools')
depends=('python')
source=("${pkgname}::git+https://github.com/disconnect3d/cint")
sha256sums=('SKIP')
provides=('python-cint-git')
conflicts=('python-cint' 'python-cint-git')

pkgver() {
  cd ${pkgname}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${pkgname}
  python3 setup.py build
}

package() {
  cd ${pkgname}
  python3 setup.py install --root=${pkgdir}/ --optimize=1 --skip-build
}
