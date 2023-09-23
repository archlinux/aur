# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Peter Lamby <peterlamby@web.de>

pkgname=deadbeef-plugin-bs2b-git
pkgver=r11.5200eae
pkgrel=1
pkgdesc="bs2b (Bauer stereophonic-to-binaural) plugin for the DeaDBeeF music player"
arch=(x86_64)
url="https://github.com/DeaDBeeF-Player/bs2b"
license=(MIT)
depends=(glibc deadbeef)
makedepends=(git)
provides=(deadbeef-plugin-bs2b)
conflicts=(deadbeef-plugin-bs2b deadbeef-bs2b)
replaces=(deadbeef-bs2b)
source=("deadbeef-plugin-bs2b::git+https://github.com/DeaDBeeF-Player/bs2b.git")
sha256sums=('SKIP')

pkgver() {
  cd deadbeef-plugin-bs2b
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd deadbeef-plugin-bs2b
  make
}

package() {
  cd deadbeef-plugin-bs2b
  install -Dm 755 ddb_bs2b.so -t "${pkgdir}/usr/lib/deadbeef/"
  install -D COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
