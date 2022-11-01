# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=karlender
_app_id=codes.loers.Karlender
pkgver=0.7.1
pkgrel=1
pkgdesc="An apative GTK-4 calendar app."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/floers/karlender"
license=('GPL3')
depends=('libadwaita' 'libnotify')
makedepends=('cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('804b21d5b24c71856f25f42adc95d7b5ea075eaffa6c3dbb82bb31afa86eecb7ec3d110247261759335ba36b03b4a67ebe6bb61a58bd23803b0dd5514fa8f506')

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
