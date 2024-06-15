# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>

pkgname=morphosis
pkgver=1.3
pkgrel=1
pkgdesc='Turn text into ASCII banners'
arch=('any')
url='https://gitlab.gnome.org/World/morphosis'
license=('GPL3')
depends=('gtk4' 'pandoc')
makedepends=('appstream-glib' 'meson' 'git' 'blueprint-compiler')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('3a040c2ea35c844a30e0e5edc888aa44c5bc9c7fef1b69bb4da254486684e0c4')

build() {
  arch-meson $pkgname-v$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
