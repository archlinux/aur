# Maintainer: Markus Hartung <mail@hartmark.se>
_pkgname=catp
pkgname=catp-git
pkgver=r22.14c5e5b
pkgrel=1
pkgdesc='Print the output of a running process'
arch=('x86_64')
url="https://github.com/rapiz1/catp"
license=('GPL')
makedepends=('rust')
source=("${pkgname}-${arch}::git+https://github.com/rapiz1/catp.git")
sha512sums=('SKIP')
conflicts=('catp')
provides=("$_pkgname")

pkgver() {
  cd "${pkgname}-${arch}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}-${arch}"
    cargo build --release --locked
}

check() {
    cd "${pkgname}-${arch}"
    cargo test --release --locked
}

package() {
    cd "${pkgname}-${arch}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${_pkgname}
}
