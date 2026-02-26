# Maintainer: Sykik [xo.sykik@gmail.com]
pkgname=inno
pkgver=0.4.0
pkgrel=1
pkgdesc="A lightweight, event-driven Wayland notification agent (Rust)"
arch=('x86_64')
url="https://github.com/SykikXO/inno"
license=('MIT')
depends=('wayland' 'cairo' 'dbus' 'glibc' 'ttf-jetbrains-mono-nerd')
makedepends=('rust' 'cargo')
backup=('etc/xdg/inno/inno.toml'
        'etc/xdg/inno/events/bluetooth.toml'
        'etc/xdg/inno/events/laptop_battery.toml'
        'etc/xdg/inno/events/headset_battery.toml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c85307817beda2333d5279fe7f4397c7de5d58884eb9715abedc0825cf64058c')

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
