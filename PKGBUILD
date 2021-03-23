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

# To get the _rid from upstream, look at the last page of
# https://www.digitalmzx.com/search.php?browse=4&desc=recordReleaseDate.
# Look for the "Source Code" download.
_rid=2610

# To get the _sha256sum from upstream, open the link from the table in the step
# above, and look at the target of the download link in the sidebar on the left.
_sha256sum=239bac1ed064ab2c08679116c25cf5fea49a337dd3835ad0bf661de1663339bc

# download.php URL: Identifies the download using the Megazeux version.
#source=("${_filename}::https://www.digitalmzx.com/download.php?latest=src&ver=${pkgver}")

# download/ URL: Identifies the download using a site-specific "rid",
# and a SHA-256 checksum of the file.  We prefer this one as it allows
# us to use the checksum from upstream (as opposed to what a packager
# downloaded).  The sha256sum is part of the URL, so it is used both
# to identify the download and to validate the file.
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
