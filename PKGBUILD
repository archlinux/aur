# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>

pkgname=simple-scan-git
pkgver=3.38.1.r11.ge11e8864
pkgrel=1
pkgdesc="Simple scanning utility"
url="https://gitlab.gnome.org/GNOME/simple-scan"
arch=(x86_64)
license=(GPL3)
groups=(gnome)
depends=(sane dconf gtk3 colord-sane libgusb)
makedepends=(yelp-tools meson vala git)
provides=(simple-scan)
conflicts=(simple-scan)
source=("${pkgname}::git+https://gitlab.gnome.org/GNOME/simple-scan.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
