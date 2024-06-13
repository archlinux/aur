# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=livi
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple GTK4 based video player for mobile phones"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/guidog/livi"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'x264' 'libgudev' 'gtk4')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('1321415e9a57d71226d1a008b16250112bd9e75eec6bf1b0e63f6f6347bedb9dc1d7c1269b9b7d6fa96c736873dbe769242703b87e87bb61ada9a0241ef5cc25')

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
