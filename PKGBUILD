# Maintainer: ml <>
pkgname=hurl-rs
pkgver=1.3.1
pkgrel=1
pkgdesc='HTTP Client to run and test requests'
arch=('x86_64')
url='https://github.com/Orange-OpenSource/hurl'
license=('Apache')
depends=('curl' 'libxml2')
makedepends=('cargo' 'python')
source=("$url"/archive/"$pkgver"/hurl-"$pkgver".tar.gz)
sha512sums=('dab97c8e30285fd4b1f76157cc6e832aa7508ca62d89f584991328916571ccd32c25cd2aa1ac56610a57f21b0ec6d03a947a17a156192af16067cbab98d9ae6b')

build() {
  cd hurl-"$pkgver"
  cargo build --release --locked
  ./ci/man.sh
}

package() {
  cd hurl-"$pkgver"
  install -Dm755 target/release/hurl{,fmt} -t "$pkgdir"/usr/bin
  install -Dm644 target/man/hurl{,fmt}.1.gz -t "$pkgdir"/usr/share/man/man1
}
