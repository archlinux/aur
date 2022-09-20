# Maintainer: gbr <gbr@protonmail.com>
pkgname=sfz
pkgver=0.7.1
pkgrel=1
pkgdesc='A simple static file server'
arch=('x86_64')
url='https://github.com/weihanglo/sfz'
license=('MIT' 'APACHE')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('93b69f4b5f0b3ab811500a907682c245ba80fcdc8a5d66ca0a883ba623a5704981343f9038f2e0d7ec54679294f5a854e28c7ab9147f7c586913cc4abf279ae9')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 'LICENSE-APACHE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 'LICENSE-MIT' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

