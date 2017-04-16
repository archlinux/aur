# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=habitat-git
pkgver=0.20.0
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
depends=('libarchive' 'libsodium')
makedepends=('cargo')
source=("${pkgname}::git+https://github.com/habitat-sh/habitat.git")
sha256sums=('SKIP')

build() {
  # Use a temporary local Cargo repository.
  export CARGO_HOME="${srcdir}/cargo-repository"

  cd "${srcdir}/${pkgname}"
  make
}

# Commented out because tests ask for sudo access
#check() {
#  # Use a temporary local Cargo repository.
#  export CARGO_HOME="$srcdir/cargo-repository"
#
#  cd "${srcdir}/${pkgname}"
#  make test
#}

package() {
  install -D -m755 "${srcdir}/${pkgname}/target/debug/hab" "${pkgdir}/usr/bin/hab"
}
