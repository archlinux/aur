# Maintainer: Sykik [xo.sykik@gmail.com]
pkgname=inno
pkgver=0.4.1
pkgrel=1
pkgdesc="A lightweight, event-driven Wayland notification agent (Rust)"
arch=('x86_64')
url="https://github.com/SykikXO/inno"
license=('MIT')
depends=('wayland' 'cairo' 'dbus' 'glibc' 'ttf-jetbrains-mono-nerd')
makedepends=('rust' 'cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4e1e0b82f1fbdb5beddb533e50d839841ace6b319062252eb3c1aff8523c2f2a')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/inno "$pkgdir/usr/bin/inno"
  install -Dm644 inno.toml "$pkgdir/etc/xdg/inno/inno.toml"
  for f in events/*.toml; do
    install -Dm644 "$f" "$pkgdir/etc/xdg/inno/$f"
  done
}
