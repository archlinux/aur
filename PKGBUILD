# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=livi
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple GTK4 based video player for mobile phones"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/guidog/livi"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'x264' 'libgudev' 'gtk4')
makedepends=('meson' 'glib2-devel')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('0f1a7b394c5c6d87a1444bb497942294e16f97ed11d626d2f5c1945d27ffc249ba23f5868ba523d5e18803e61475cf3e4c9e4e3a296764fd06f3e6fd89d18482')

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
