# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=purism-stream
_pkgname=Stream
pkgver=0.1.6
pkgrel=2
pkgdesc="YouTube client for GNOME, built for the Librem 5"
arch=('x86_64')
url="https://source.puri.sm/todd/Stream"
license=('GPL3')
depends=('libhandy' 'python-gobject' 'pulseaudio')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
b2sums=('ad753e8708be1cdb417fb38031a65c1b5ecba36dd524ed877ed667382ed447430fc10e457ec2ba284baab18e2821171fa796bbeee9160f21d1bbdb1532141de0')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
