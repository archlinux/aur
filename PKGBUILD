# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>

pkgname=haguichi-git
_pkgname=haguichi
pkgver=1.5.3.r0.g43db09e
pkgrel=1
pkgdesc="Provides a user friendly GUI to control the Hamachi client on Linux (development version)"
arch=(x86_64)
url="https://github.com/ztefn/haguichi"
license=(GPL-3.0-or-later)
depends=(
  gtk4
  libadwaita
  libgee
  libportal
  libportal-gtk4
  logmein-hamachi
)
makedepends=(
  git
  meson
  vala
)
conflicts=(haguichi)
provides=(haguichi)
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
