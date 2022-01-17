# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=contrast-git
pkgver=0.0.5.r0.g37250e4
pkgrel=1
pkgdesc='Check whether the contrast between two colors meets the WCAG requirements'
arch=('x86_64')
url='https://gitlab.gnome.org/World/design/contrast'
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita')
makedepends=('git' 'meson' 'rust')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  git -C "${pkgname%-git}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
