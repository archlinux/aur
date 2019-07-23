# Original AUR Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Current Maintainer: Dylan Morrison <dylanjmorrison611 at gmail.com>

pkgname=megazeux
pkgver=2.92
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
_sha256sum=841cf520002b6807ca2a11368be7942fd3eea8dc85f59b1cea07a7fba48e6c1e

##old version
#source=("${_filename}::http://vault.digitalmzx.net/download.php?rid=2197&f=${_sha256sum}")

##new version
source=("${_filename}::http://vault.digitalmzx.net/download.php?latest=src&ver=${pkgver}")

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
