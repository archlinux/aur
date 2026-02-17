# Maintainer: ShinKouyo <i@0x0f.dev>
pkgname=pins-git
_pkgname=Pins
pkgver=2.4.5.r3.ge59d0c5
pkgrel=1
pkgdesc="Create and edit app shortcuts"
arch=('x86_64')
url="https://github.com/fabrialberio/Pins"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita')
makedepends=('git' 'meson' 'ninja')
provides=('pins')
conflicts=('pins')
options=('!debug')
source=("git+https://github.com/fabrialberio/Pins.git")
sha256sums=('SKIP')
pkgver() {
  cd "$_pkgname" || exit 1
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}
package() {
  meson install -C build --destdir "$pkgdir"
}
