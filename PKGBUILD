# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=karlender
pkgver=0.6.1
pkgrel=1
pkgdesc="An apative GTK-4 calendar app."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/loers/karlender"
license=('GPL3')
depends=('libadwaita' 'libnotify')
makedepends=('cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('90023f9f1fdf54b95892447c9580acdf97e7c5439a3911b5a27cf2e5294264cb2acfa5ed025bcd0c8e722aea19cef9e73d1a26894e2ba729653761cafb4f5f71')

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
