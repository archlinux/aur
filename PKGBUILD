# Maintainer: Janek Thomaschewski <janek@thomaschewski.dev>

pkgname=blueberry-wayland
_pkgname=blueberry
provides=(blueberry)
conflicts=(blueberry)
pkgver=1.4.8
pkgrel=1
pkgdesc="Bluetooth configuration tool - Patched systray for Wayland/AppIndicator support"
arch=(any)
url="https://github.com/linuxmint/blueberry"
license=(GPL)
depends=(bluez-tools gnome-bluetooth python-dbus python-gobject python-setproctitle rfkill xapps)
source=(
	https://github.com/linuxmint/blueberry/archive/$pkgver/$pkgname-$pkgver.tar.gz
	wayland.patch
)
sha256sums=('37a5b0bc3c7cbccee625209b9196a2e2966396cfe5c7652318559642fb6a7a32'
            '80edd86b6fb78a21aab128355990ceca40634c52454fae5f63bcf1953b8b2711')

prepare() {
  cd $_pkgname-$pkgver
  patch --forward --strip=1 --input="${srcdir}/wayland.patch"
}

build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd $_pkgname-$pkgver
  cp -r etc usr "$pkgdir"
}
