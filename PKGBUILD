# Maintainer: Sykik [xo.sykik@gmail.com]
pkgname=inno
pkgver=0.2.1
pkgrel=1
pkgdesc="A lightweight, event-driven Wayland notification agent (Rust)"
arch=('x86_64')
url="https://github.com/SykikXO/inno"
license=('MIT')
depends=('wayland' 'cairo' 'dbus' 'glibc')
makedepends=('rust' 'cargo')
backup=('etc/xdg/inno/inno.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b23d892d4c0faac8e8598b98958908b4b90342dff64ba535fa74abba5aebaaee')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/inno "$pkgdir/usr/bin/inno"
  install -Dm644 inno.conf "$pkgdir/etc/xdg/inno/inno.conf"
  install -Dm644 inno.service "$pkgdir/usr/lib/systemd/user/inno.service"
}
