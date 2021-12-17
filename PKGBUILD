# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=flowtime-git
_pkgname=Flowtime
pkgver=1.1.0.r2.g5f29484
pkgrel=1
pkgdesc="Get what motivates you done, without losing concentration"
arch=('x86_64')
url="https://github.com/Diego-Ivan/Flowtime"
license=('GPL3')
depends=('glib2' 'gtk4' 'gstreamer' 'libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
