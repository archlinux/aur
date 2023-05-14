# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=symbolic-preview
pkgver=0.0.8
pkgrel=1
pkgdesc="Symbolics made easy"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/symbolic-preview"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('ddb823cf11ff7e2bbdd728ed944cb6eddc7e6efc98c9d4e16cd9a12ea0d19131e8df6207b792c0d2515572712e3e90f66159821a73839544798b355dda408692')

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
