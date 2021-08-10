# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=hackgregator
pkgver=0.3.0
pkgrel=1
pkgdesc="This application is a comfortable reader application for news.ycombinator.com"
arch=('x86_64')
url="https://gitlab.com/gunibert/hackgregator"
license=('GPL3')
depends=('glib2' 'gtk3' 'libhandy' 'libsoup' 'json-glib' 'webkit2gtk')
makedepends=('git' 'gobject-introspection' 'meson' 'ninja')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('577a9f0d2185d67c14e2fd26a7ecec15a4512b693253198c68a31c132f621426')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
