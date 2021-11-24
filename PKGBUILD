# Maintainer: ml <>
pkgname=hurl-rs
pkgver=1.4.0
pkgrel=1
pkgdesc='HTTP Client to run and test requests'
arch=('x86_64')
url='https://github.com/Orange-OpenSource/hurl'
license=('Apache')
depends=('curl' 'libxml2')
makedepends=('cargo' 'python')
source=("$url"/archive/"$pkgver"/hurl-"$pkgver".tar.gz)
sha512sums=('7609550afbd6ebb57f9c1ac1bc0de9ac74042d346a6d9c7e0a82879da03d917f4adc0037980f70a90585a15286bb7db8a3d321f96130345b7b129e2869ba3925')

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
