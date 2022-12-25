# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=flowtime
pkgver=3.0
pkgrel=1
pkgdesc="Get what motivates you done, without losing concentration"
arch=('x86_64' 'aarch64')
url="https://github.com/Diego-Ivan/Flowtime"
license=('GPL3')
depends=('gstreamer' 'libadwaita' 'libxml2' 'libgee')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
_commit=aac2c1ecfc0d2081af9fa2f9010caa73486b937a # tags/3.0^0
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
