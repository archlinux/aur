# Maintainer: danb (danb) <danb (at) hasi.it>

pkgname=avizo
pkgver=1.0+38+g9326b1e
pkgrel=1
pkgdesc="A neat notification daemon"
url="https://github.com/misterdanb/avizo"
arch=(x86_64)
license=(GPL)
depends=(gtk3 gtk-layer-shell dbus light alsa-utils)
makedepends=(vala meson git)
_commit=9326b1e33e05502df7e8fdf5cf323fc2c32484cb
source=("git+https://github.com/misterdanb/avizo")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  git checkout $_commit
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
