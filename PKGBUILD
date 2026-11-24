# Maintainer: Samueru-sama xdglawyer@outlook.com

pkgname=reliabilitty
pkgver=0.1.21
pkgrel=1
pkgdesc="A small, fast, reliable X11 terminal emulator"
arch=('x86_64' 'aarch64')
url=https://github.com/pkgforge-apps/reliabilitty
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'rust' 'git')
source=("$pkgname::git+https://github.com/pkgforge-apps/reliabilitty.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/"$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir"/"$pkgname"
  install -Dm755 ./target/release/rtty \
    "$pkgdir"/usr/bin/rtty
  install -Dm644 ./packaging/linux/app.desktop \
    "$pkgdir"/usr/share/applications/reliabilitty.desktop
  install -Dm644 ./assets/icon.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/reliabilitty.svg
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 ./assets/icons/$size.png \
      "$pkgdir"/usr/share/icons/hicolor/${size}x$size/apps/reliabilitty.png
  done
  install -Dm644 ./rtty.example.conf \
    "$pkgdir"/usr/share/doc/"$pkgname"/rtty.example.conf
  install -Dm644 ./LICENSE \
    "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
