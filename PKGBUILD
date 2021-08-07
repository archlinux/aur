# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=highscore
pkgver=40.0
pkgrel=1
pkgdesc="Highscore is a retro gaming application for the GNOME desktop"
arch=('any')
url="https://gitlab.gnome.org/World/highscore"
license=('GPL3')
depends=('tracker' 'grilo' 'grilo-plugins' 'glib2' 'libsass' 'sassc' 'gtk3' 'libadwaita' 'libhandy' 'libevdev' 'libmanette' 'libarchive' 'retro-gtk' 'librsvg' 'libsoup' 'sqlite' 'libxml2')
makedepends=('meson' 'gcc' 'vala')
optdepends=('libretro')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP') #autofill using updpkgsums

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}