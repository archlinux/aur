# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=icon-library
pkgver=0.0.16
pkgrel=1
pkgdesc='Find the right symbolic icon to use on your GNOME application'
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/icon-library"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('1ee929790db191f6f2835f959cbf05aee1116414f2160cb67bf353b101f0c9cf06fd4f9dc0157d93004e61ecc9fa9230a059fefe1d2c73c8acc7520d7c4650d3')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

