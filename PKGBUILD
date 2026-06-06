# Maintainer: KiyokoDev <kiyoko@kiyoko.dev>

pkgname=markup-swift
_pkgname=Markup-Swift
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal, fast markdown editor with live preview"
arch=('x86_64')
url="https://github.com/KiyokoDev/Markup-Swift"
license=('custom:CC-BY-NC-SA')
depends=(
  gtk3
  libxcb
  libxkbcommon
  wayland
  fontconfig
)
makedepends=(
  cargo
  rust
)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  RUSTFLAGS="-C link-arg=-s" cargo build --release --locked
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 resources/$pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 resources/$pkgname.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
