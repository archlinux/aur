# PKGBUILD

pkgname=wayruler-git
pkgver=r20.88c4cd5
pkgrel=1
pkgdesc="A native Wayland smart screen measurement tool for KDE Plasma (PowerToys Screen Ruler clone)"
arch=('x86_64')
url="https://github.com/Mahmoud-walid/WayRuler"
license=('Apache')
depends=('gtk4' 'gtk4-layer-shell' 'cairo' 'glibc' 'spectacle')
makedepends=('cargo' 'git' 'rust')
provides=('wayruler')
conflicts=('wayruler')
source=("WayRuler::git+https://github.com/Mahmoud-walid/WayRuler.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/WayRuler"

  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/WayRuler"

  export CARGO_TARGET_DIR=target

  cargo build --release --locked
}

package() {
  cd "$srcdir/WayRuler"

  install -Dm755 \
    target/release/wayruler \
    "$pkgdir/usr/bin/wayruler"

  install -Dm644 \
    LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 \
    wayruler.desktop \
    "$pkgdir/usr/share/applications/wayruler.desktop"

  install -Dm644 \
    assets/wayruler.png \
    "$pkgdir/usr/share/pixmaps/wayruler.png"

  install -d "$pkgdir/usr/share/wayruler/icons"

  install -m644 src/assets/*.svg \
    "$pkgdir/usr/share/wayruler/icons/"
}
