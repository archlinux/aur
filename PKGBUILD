# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=livi
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple GTK4 based video player for mobile phones"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/guidog/livi"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'x264' 'libgudev' 'gtk4')
makedepends=('meson' 'glib2-devel')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('88fc27313c8dea7fba45648ab85cbb6eb62cad0cc42e1af59afe2ccd7898044c2300146639115904696ec0f8be1643843c147609fe60cc5b9291bd5112e63571')

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
