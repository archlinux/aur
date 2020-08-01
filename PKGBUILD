# Original AUR Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Current Maintainer: Dylan Morrison <dylanjmorrison611 at gmail.com>

pkgname=megazeux
pkgver=2.92e
pkgrel=1
pkgdesc="Game creation system"
arch=('i686' 'x86_64')
url="https://www.digitalmzx.com/"
license=('gpl')
groups=('games')
depends=(libvorbis libpng sdl2)
makedepends=()
_base=mzx${pkgver/.}
_filename=${_base}src.tar.xz
_sha256sum=1d25e7cc07a9ffdba229bfe59b9a52eff8d7459be78cfb7eb9746539b51634be

##old version
#source=("${_filename}::https://www.digitalmzx.com/download.php?rid=2197&f=${_sha256sum}")

##new version
source=("${_filename}::https://www.digitalmzx.com/download.php?latest=src&ver=${pkgver}")

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
