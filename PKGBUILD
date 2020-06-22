# Maintainer: Ryan Cragun <me@ryan.ec>
# http://packages.chef.io/files/stable/habitat/latest/manifest.json
pkgname=habitat
pkgver=1.6.56
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
depends=('libarchive' 'libsodium' 'openssl')
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

package() {
  install -D -m755 "${srcdir}/${pkgname}/target/debug/hab" "${pkgdir}/usr/bin/hab"
}
