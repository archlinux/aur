# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=megazeux
pkgver=2.91
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
_sha256sum=6ba768b8143a3964cf66e66807f0f68e2f3569b96fcf7dd5432636d85b6f93a7
source=("${_filename}::http://vault.digitalmzx.net/download.php?rid=2197&f=${_sha256sum}")
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
