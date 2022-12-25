# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=flowtime-git
pkgver=3.0.r0.gaac2c1e
pkgrel=1
pkgdesc="Get what motivates you done, without losing concentration"
arch=('x86_64' 'aarch64')
url="https://github.com/Diego-Ivan/Flowtime"
license=('GPL3')
depends=('gstreamer' 'libadwaita' 'libxml2' 'libgee')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+$url.git)
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
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
