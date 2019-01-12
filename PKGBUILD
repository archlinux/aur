# Maintainer: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgname=gnome-font-viewer-git
pkgver=3.30.0+38+g85c4210
pkgrel=1
pkgdesc="A font viewer utility for GNOME"
url="https://gitlab.gnome.org/GNOME/gnome-font-viewer"
arch=(x86_64)
license=(GPL)
provides=(gnome-font-viewer)
conflicts=(gnome-font-viewer)
depends=(gtk3 gnome-desktop)
makedepends=(git meson)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-font-viewer.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-font-viewer
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson gnome-font-viewer build
  ninja -C build
}

check() {
  cd build
  meson test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
