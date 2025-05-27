# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>

pkgname=alt-hasherc-git
pkgver=0.1.0.r0.gc2d316b
pkgrel=1
pkgdesc="A tool for building packages for ALT operating systems in containers"
arch=(x86_64)
url="https://altlinux.space/alt-gnome/hasherc"
license=(GPL-3.0-or-later)
depends=(
   podman
   python
)
makedepends=(
  meson
) 
options=(!debug)
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  git -C ${pkgname%-git} describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  arch-meson ${pkgname%-git} build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
