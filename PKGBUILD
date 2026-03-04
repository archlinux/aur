# Maintainer: shiro shiroanony@gmail.com
pkgname=clippa-rs
pkgver=0.1.5.2
pkgrel=3
pkgdesc="A clipboard manager tui/service for wayland based compositors written in rust"
arch=(x86_64 i686)
url="https://github.com/shiroanon/clippa-rs"
license=('MIT')
depends=(gcc-libs glibc wl-clipboard)
makedepends=(cargo git cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/shiroanon/clippa-rs/archive/v$pkgver.tar.gz"
  "clippa-harvest.service::https://raw.githubusercontent.com/shiroanon/clippa-rs/v$pkgver/clippa-harvest.service")
sha256sums=('e15ef933ebcc7dd040bec41a5131a9fa1c253c6aad1d3e214aa3c680150fcc4b'
  '1a9166d74a12a3f3bc496a3cd16127beb402406c2fc60d3666d6c8e9112462dd')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/clippa-harvest" "$pkgdir/usr/bin/clippa-harvest"
  install -Dm755 "target/release/clippa-manage" "$pkgdir/usr/bin/clippa-manage"
  install -Dm644 "$srcdir/clippa-harvest.service" "$pkgdir/usr/lib/systemd/user/clippa-harvest.service"

}
