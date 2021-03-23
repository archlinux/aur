# Original AUR Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Current Maintainer: Dylan Morrison <dylanjmorrison611 at gmail.com>

pkgname=megazeux
pkgver=2.92f
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
_sha256sum=239bac1ed064ab2c08679116c25cf5fea49a337dd3835ad0bf661de1663339bc
_rid=2610

# Latest URL: always points towards the latest version, but when it
# is updated, breaks building of this package.
#source=("${_filename}::https://www.digitalmzx.com/download.php?latest=src&ver=${pkgver}")

# Stable URL: points towards a specific version, but the rid must be updated manually.
# To find it, look at the last page of https://www.digitalmzx.com/search.php?browse=4&desc=recordReleaseDate.
# Additionally, the sha256sum is part of the URL, so it is
# used both to identify the download and to validate the file.
source=("${_filename}::https://www.digitalmzx.com/download/${_rid}/${_sha256sum}/")

sha256sums=("${_sha256sum}")

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
