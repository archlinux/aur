# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=megazeux
pkgver=2.90c
pkgrel=1
pkgdesc="Game creation system"
arch=('i686' 'x86_64')
url="http://www.digitalmzx.net/"
license=('gpl')
groups=('games')
depends=(libvorbis libpng sdl2)
makedepends=()
_base=mzx${pkgver/.}
_filename=${_base}src.tar.xz
_sha256sum=0de1aa76ce92cdc7db0c51f58e1561206b30939b5cc7a82705cc7921348ca4c6
source=("${_filename}::http://vault.digitalmzx.net/download.php?rid=2168&f=${_sha256sum}")
sha256sums=("${_sha256sum}")
DLAGENTS=("http::/usr/bin/curl -A 'Mozilla' -fLC - -o %o %u")

build() {
  cd "${srcdir}/${_base}"

  ./config.sh \
	  --platform unix \
	  --prefix /usr \
	  --bindir /usr/lib/megazeux \
	  --gamesdir /usr/bin

  echo 'RAWLIBDIR=lib' >> platform.inc
  echo 'LIBDIR=/usr/lib' >> platform.inc

  make
}
package() {
  cd "${srcdir}/${_base}"

  make DESTDIR="$pkgdir/" install
}

# Local Variables:
# pkgbuild-update-sums-on-save: nil
# End:
