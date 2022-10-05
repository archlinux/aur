# Maintainer: CosmicHorror <LovecraftianHorror@pm.me>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-insta
pkgver=1.20.0
pkgrel=1
pkgdesc="Cargo plugin for snapshot testing in Rust"
url="https://github.com/mitsuhiko/insta"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('APACHE')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d327ba6a94e8909f48dd4635787371cc61ab9dc151289cbeeab3a1b3a38cbeb20216f8d291bb9989540896bfaa6ab1543e7ade3375074bce724a8ca8d0599697')

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
