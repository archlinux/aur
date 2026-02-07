# Maintainer: Sykik [xo.sykik@gmail.com]
pkgname=inno
pkgver=0.3.0
pkgrel=1
pkgdesc="A lightweight, event-driven Wayland notification agent (Rust)"
arch=('x86_64')
url="https://github.com/SykikXO/inno"
license=('MIT')
depends=('wayland' 'cairo' 'dbus' 'glibc')
makedepends=('rust' 'cargo')
backup=('etc/xdg/inno/inno.toml' 'etc/xdg/inno/events/battery.toml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1770f8d72f14d4583616187bfcf276dae924a5b6bc3a2c00b0ae314bc6ce24cf')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/inno "$pkgdir/usr/bin/inno"
  install -Dm644 inno.toml "$pkgdir/etc/xdg/inno/inno.toml"
  install -Dm644 events/battery.toml "$pkgdir/etc/xdg/inno/events/battery.toml"
  install -Dm644 inno.service "$pkgdir/usr/lib/systemd/user/inno.service"
}
