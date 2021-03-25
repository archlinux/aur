pkgname=gnome-health-git
pkgver=0.92.6+5+g6edaad5
pkgrel=1
pkgdesc="A health tracking app for the GNOME desktop"
arch=(x86_64)
url="https://gitlab.gnome.org/Cogitri/Health"
license=(GPL3)
depends=('libadwaita')
makedepends=('git' 'meson')
provides=('gnome-health')
conflicts=('gnome-health')
source=("git+https://gitlab.gnome.org/Cogitri/Health.git")
b2sums=('SKIP')

pkgver() {
  cd Health
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson Health build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
