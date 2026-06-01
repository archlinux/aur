# Maintainer: shirushimori

pkgname=auto-fg
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast FitGirl repack link extraction and download automation tool"
arch=('x86_64')
url="https://github.com/shirushimori/Auto-FG"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'hicolor-icon-theme')
makedepends=('cargo' 'clang' 'pkgconf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shirushimori/Auto-FG/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a6c823b290ec1fa08c331eacc29a1fb4cad1bc1bd7c88b7a34f6f2092adcd7f')

prepare() {
  cd "Auto-FG-$pkgver"
  cargo fetch --locked
}

build() {
  cd "Auto-FG-$pkgver"
  cargo build --release --locked
}

package() {
  cd "Auto-FG-$pkgver"

  install -Dm755 target/release/Ffast-auto-downloader \
    "$pkgdir/usr/bin/auto-fg"

  install -Dm755 target/release/get-links \
    "$pkgdir/usr/bin/auto-fg-get-links"

  install -Dm755 target/release/download \
    "$pkgdir/usr/bin/auto-fg-download"

  install -Dm644 assets/Auto-FG.desktop \
    "$pkgdir/usr/share/applications/auto-fg.desktop"

  install -Dm644 assets/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/auto-fg.svg"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
