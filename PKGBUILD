# Maintainer: ToadKing <toadking at toadking dot com>
pkgname=deadbeef-pipewire-plugin-git
pkgver=r23.3608435
pkgrel=1
pkgdesc="Pipewire output plugin for the DeaDBeeF music player (devel branch)"
arch=('i686' 'x86_64')
url="https://github.com/saivert/ddb_output_pw"
license=('GPL2')
depends=('pipewire' 'deadbeef')
makedepends=('git' 'meson')
source=('git+https://github.com/saivert/ddb_output_pw.git')
md5sums=('SKIP')

build() {
  arch-meson ddb_output_pw build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

pkgver() {
  cd "$srcdir/ddb_output_pw"
  echo r$(git rev-list --count main).$(git rev-parse --short main)
}
