# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=karlender
pkgver=0.6.0
pkgrel=1
pkgdesc="An apative GTK-4 calendar app."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/loers/karlender"
license=('GPL3')
depends=('libadwaita' 'libnotify')
makedepends=('cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('5b6ae53d1c40b0b882744b50f68a03355a5ae0541071a82ac126e07fe7cc64e71b6405edc885a7417cc3f4a8b0bd2440668dd7bed9bbd10596054639609544a2')

build() {
  cd "$pkgname-v$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-v$pkgver"

  sed -i 's|ROOT=/app|ROOT=/usr|g' target/gra-gen/Makefile

  make -C target/gra-gen ROOT="$pkgdir/usr" install
  make -C target/gra-gen ROOT="$pkgdir/usr" install-gsettings

  rm "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
