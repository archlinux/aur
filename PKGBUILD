# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=hackgregator-git
pkgver=0.3.0.r9.g2c3ce65
pkgrel=1
pkgdesc="This application is a comfortable reader application for news.ycombinator.com"
arch=('x86_64')
url="https://gitlab.com/gunibert/hackgregator"
license=('GPL3')
depends=('glib2' 'gtk3' 'libhandy' 'libsoup' 'json-glib' 'webkit2gtk')
makedepends=('git' 'gobject-introspection' 'meson' 'ninja')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
