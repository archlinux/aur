# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=picplanner
pkgver=0.3.1
pkgrel=1
pkgdesc="Plan your next photo locations"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zwarf/picplanner"
license=('GPL3')
depends=('libadwaita' 'libshumate' 'libgweather-4' 'geoclue' 'geocode-glib' 'protobuf' 'protobuf-c')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz
0179-fix-dependency.patch)
b2sums=('28df438c785e4dfeb805ba8954ec749b187115b22ace66c8259ad238c9a986cbd4a1bb32444b58d515316b56086ccd7cf8891dd9c7b5b5ac0ab4a2ed3ae6984c'
        'b3c0209ccafac973a3a04f509f0dd7a2ea49d210321b8a1f83c86fb1d17d08793998e9a88ae86b9abc066094b543496e075d1552074a549b13cb2996c72f3b68')

prepare() {
  cd $pkgname-v$pkgver
  patch -p1 -i ../0179-fix-dependency.patch
}

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
