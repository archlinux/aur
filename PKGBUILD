# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=hackgregator
pkgver=0.4.1
pkgrel=1
pkgdesc="This application is a comfortable reader application for news.ycombinator.com"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/gunibert/hackgregator"
license=('GPL3')
depends=('libadwaita' 'libsoup3' 'json-glib' 'webkit2gtk-5.0')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('c7fbee8bff26f9a426a2cc083773903a60141063ecbcb3a9db184d593153f2ccb8d1bf5fa2ab2c809515522b3865a42c92ceb3137e86a9f9a5d73d0b09cc1445')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
