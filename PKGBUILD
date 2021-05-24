# Maintainer: 1Conan <me@1conan.com>
pkgname=opendrop-git
pkgver=0.0.0.r12.bf6d47f
pkgrel=1
pkgdesc="OpenDrop: an Open Source AirDrop Implementation"
arch=('any')
url="https://github.com/seemoo-lab/opendrop"
license=('GPL3')
makedepends=(
  'git'
)
depends=(
  'owlink-git'
  'python'
  'python-libarchive-c'
  'python-requests-toolbelt'
  'python-pillow'
  'python-netifaces'
  'python-requests'
  'python-ifaddr'
  'python-zeroconf'

  'python-ctypescrypto-git'
  'python-fleep-git'
)
source=("$pkgname::git+https://github.com/seemoo-lab/opendrop#branch=master")
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
