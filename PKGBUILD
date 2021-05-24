# Maintainer: 1Conan <me@1conan.com>
pkgname=python-ctypescrypto-git
pkgver=0.0.0.r106.90b32fd
pkgrel=1
pkgdesc="Python interface to some openssl function based on ctypes module"
arch=('any')
url="https://github.com/vbwagner/ctypescrypto"
license=('MIT')
makedepends=('git')
depends=('openssl' 'python')
source=("$pkgname::git+https://github.com/vbwagner/ctypescrypto#branch=master")
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
