# Maintainer: Archisman Panigrahi <apandada1 AT gmail DOT com>

pkgname=subscribi
pkgver=1.0.1
pkgrel=1
pkgdesc='Keep tabs on subscriptions (COSMIC desktop app)'
arch=('any')
url='https://codeberg.org/Tony4dev/subscribi'
license=('custom:NON-AI-MPL-2.0')
depends=('glibc' 'libxkbcommon' 'sqlite' 'cosmic-icon-theme')
makedepends=('cargo' 'git' 'rust')
conflicts=('subscribi-git')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/subscribi"
  export CARGO_TARGET_DIR="target"
  cargo build --release --locked --package subs_cosmic --bin subs_cosmic
}

package() {
  cd "$srcdir/subscribi"

  install -Dm755 "target/release/subs_cosmic" "$pkgdir/usr/bin/subscribi"
  install -Dm644 "resources/app.desktop" \
    "$pkgdir/usr/share/applications/dev.tony4.subscribi.desktop"
  install -Dm644 "resources/app.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/dev.tony4.subscribi.metainfo.xml"
  install -Dm644 "resources/icons/hicolor/scalable/apps/icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.tony4.subscribi.svg"

  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
