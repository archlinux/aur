# Maintainer: 1Conan <me@1conan.com>
pkgname=python-fleep-git
pkgver=0.0.0.r21.994bc2c
pkgrel=2
pkgdesc="File format determination library for Python"
arch=('any')
url="https://github.com/floyernick/fleep-py"
license=('MIT')
makedepends=('git' 'python-setuptools')
depends=('python')
source=("$pkgname::git+https://github.com/floyernick/fleep-py.git#branch=master")
sha512sums=("SKIP")

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
