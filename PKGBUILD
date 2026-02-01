# Maintainer: Swapnil Devesh <me@sidevesh.com>

pkgname=luminance
_pkgname=Luminance
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple GTK application to control brightness of displays including external displays supporting DDC/CI"
arch=('x86_64')
url="https://github.com/sidevesh/$_pkgname"
license=('GPL3')
makedepends=('git' 'meson')
depends=('glib2' 'gtk4' 'libadwaita' 'ddcutil')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://github.com/sidevesh/$_pkgname.git#tag=$pkgver" "git+https://github.com/ahshabbir/ddcbc-api.git")
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init ddcbc-api
  git config submodule.ddcbc-api.url "$srcdir/ddcbc-api"
  git -c protocol.file.allow=always submodule update ddcbc-api
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
