# Maintainer: Johannes von Scheidt <37270902+jvonscheidt at users dot noreply dot github dot com>

pkgname=m3u-viewer
pkgver=0.8.0
pkgrel=1
pkgdesc="Fast terminal viewer for large M3U and M3U8 playlists"
arch=('x86_64')
url="https://github.com/jvonscheidt/m3u-viewer"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('vlc: play selected channels')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('398ccd49b8098201996e4b259b7572194da9e9c4e3803e308102fc52735dc0e9')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" target/release/m3u-viewer
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
