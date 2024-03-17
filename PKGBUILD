# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=livi-git
_pkgname="${pkgname%-git}"
pkgver=0.1.0.r0.2995b99
pkgrel=1
pkgdesc="A simple GTK4 based video player for mobile phones"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/guidog/livi"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'x264' 'libgudev')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long | sed 's/v//g' | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
