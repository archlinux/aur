# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=textpieces-git
_pkgname=textpieces
pkgver=3.0.2.r56.gc1e0f77
pkgrel=1
pkgdesc="Small tool for quick text transformations such as hashes, encoding, decoding and so on"
arch=('x86_64')
url="https://github.com/liferooter/textpieces"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'python-pyaml' 'gtksourceview5')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
