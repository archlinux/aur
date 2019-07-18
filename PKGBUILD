# Maintainer: aereaux <aidan@jmad.org>
_pkgname=meli
pkgname=${_pkgname}-git
pkgver=pre.alpha.0.0.1.r3.g1e72901
pkgrel=3
pkgdesc="Experimental terminal mail client aiming for configurability and extensibility with sane defaults."
arch=("x86_64")
url="https://meli.delivery/"
license=('GPL3')
depends=()
makedepends=("git" "rust")
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://git.meli.delivery/meli/meli.git")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  cargo build --release #--locked
}

check() {
  cd "$_pkgname"

  cargo test --release --locked
}

package() {
  cd "$_pkgname"

  install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
}
