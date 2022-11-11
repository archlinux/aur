# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=symbolic-preview
pkgver=0.0.4
pkgrel=1
pkgdesc="Symbolics made easy"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/symbolic-preview"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('f1bdbdc93ac2a294e2e529fc5d10059667f347ed48c1add90614462cd2f4368f8e1897bfd7145563224a82d7e4dea82dba7e5ebde261f37cdafcb55b52f72c5f')

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
