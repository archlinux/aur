# Maintainer: danb (danb) <danb (at) hasi.it>

pkgname=avizo
pkgver=1.0
pkgrel=1
pkgdesc="A neat notification daemon"
url="https://github.com/misterdanb/avizo"
arch=(x86_64)
license=(GPL)
depends=(gtk3 dbus)
makedepends=(vala meson git)
_commit=tags/1.0
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
