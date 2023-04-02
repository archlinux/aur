# Maintainer: CosmicHorror <LovecraftianHorror@pm.me>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-insta
pkgver=1.29.0
pkgrel=1
pkgdesc="Cargo plugin for snapshot testing in Rust"
url="https://github.com/mitsuhiko/insta"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('APACHE')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c44816913ebe137c238beb71831dff3638cf7fdabeb368a42ce661b0938355878fa315b01a2fb3c244a514c8089326c425068fbee9f683def4fd15343bffeb72')

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
