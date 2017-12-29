# Maintainer: David Parrish <daveparrish@tutanota.com>
# Maintainer: Trevor Bramble <inbox@trevorbramble.com>

pkgname=habitat-git
pkgver=0.51.0.r89.g658c61309
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
depends=('libarchive' 'libsodium')
makedepends=('git' 'cargo')
provides=('habitat')
conflicts=('habitat-bin' 'habitat-git')
source=("${pkgname}::git+https://github.com/habitat-sh/habitat.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
