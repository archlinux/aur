# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=karlender
_app_id=codes.loers.Karlender
pkgver=0.8.0
pkgrel=1
pkgdesc="An apative GTK-4 calendar app."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/floers/karlender"
license=('GPL3')
depends=('libadwaita' 'libnotify')
makedepends=('cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('8b004c301da7133afe9911e04fd5f182ce61c5e0ae0086a5e6c660b15f571fc36aa0fa4c533cb30f08f20efc24a2e84bf16d139c7dea5c466e7086a4aa55dddd')

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
