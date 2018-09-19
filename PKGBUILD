# Maintainer: Trevor Bramble <inbox@trevorbramble.com>

pkgname=habitat
pkgver=0.63.0
pkgrel=2
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
depends=('libarchive' 'libsodium' 'openssl<1.1.1')
makedepends=('git' 'cargo' 'zeromq')
provides=('habitat')
conflicts=('habitat-bin' 'habitat-git')
source=("${pkgname}::git+https://github.com/habitat-sh/habitat.git#tag=${pkgver}")
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
