# Maintainer: Sykik [xo.sykik@gmail.com]
pkgname=inno
pkgver=0.2.0
pkgrel=1
pkgdesc="A lightweight, event-driven Wayland notification agent (Rust)"
arch=('x86_64')
url="https://github.com/SykikXO/inno"
license=('MIT')
depends=('wayland' 'cairo' 'dbus' 'glibc')
makedepends=('rust' 'cargo')
backup=('etc/xdg/inno/inno.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f8829d2c10fd679b432ba259d4d3c7f2bcaff23f19815f62a876b62f2463d0d9')

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
