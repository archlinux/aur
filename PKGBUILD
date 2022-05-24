# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=avvie-git
pkgver=2.1.r9.g2e15c7d
pkgrel=1
pkgdesc="A utility for quickly cropping images"
arch=('any')
url="https://github.com/Taiko2k/avvie"
license=('GPL3')
depends=('libadwaita' 'python-cairo' 'python-gobject' 'python-piexif' 'python-pillow')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')


pkgver() {
  cd "$srcdir/${pkgname%-git}"
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

