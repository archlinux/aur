# Maintainer: LovecraftianHorror <LovecraftianHorror@pm.me>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-insta
pkgver=1.13.0
pkgrel=1
pkgdesc="Cargo plugin for snapshot testing in Rust"
url="https://github.com/mitsuhiko/insta"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('APACHE')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a2b13c7f66cb068dde5592646a7b8e45789bd5b40317406540080b4c726d02c77743ee031a7e01dc46054293dc1bfc73a7de22433d95627f778d7e21d06ee818')

build() {
  cd "$srcdir/insta-$pkgver/cargo-insta"
  cargo build --release --locked
}

check() {
  cd "$srcdir/insta-$pkgver/cargo-insta"
  cargo test --release --locked
}

package() {
  cd "$srcdir/insta-$pkgver/cargo-insta"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
