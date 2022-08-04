# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=textpieces-git
pkgver=3.0.2.r70.g183f494
pkgrel=1
pkgdesc="Transform text without using random websites"
arch=('x86_64' 'aarch64')
url="https://github.com/liferooter/textpieces"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'python-pyaml' 'gtksourceview5' 'libgee')
makedepends=('git' 'blueprint-compiler' 'gobject-introspection' 'meson' 'vala')
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
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
