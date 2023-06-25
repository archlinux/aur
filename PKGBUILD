# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-insta
pkgver=1.30.0
pkgrel=1
pkgdesc="Cargo plugin for snapshot testing in Rust"
url="https://github.com/mitsuhiko/insta"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('APACHE')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('2213fdd501b17d3490f57a9177d64b8c68e8d0843baf5382dbd76bcea7afc6c42046975fe6d135c2b8fc2bb806d9ec70d72ad5b54f4f6c384689029eb458636a')

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
