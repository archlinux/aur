# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=livi
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple GTK4 based video player for mobile phones"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/guidog/livi"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'x264' 'libgudev' 'gtk4')
makedepends=('meson' 'glib2-devel')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('cdbee2275897525c626f75f6312725883460c7451082954b49a0da8ecb935777bf800686958f489de53d678034d9b46cfaa2438d6cd6c9f95c8694616a8f95e9')

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
