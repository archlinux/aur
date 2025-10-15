# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: goetzc
# Contributor: Kim Scarborough <sluggo@unknown.nu>

pkgname=cantata-git
pkgver=3.3.1.r21.gdc5a0ce
pkgrel=2
pkgdesc="Qt6 graphical client for Music Player Daemon (MPD), nullobsi fork"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/nullobsi/cantata"
license=(GPL-3.0-or-later)
depends=(qt6-base
         qt6-multimedia
         qt6-svg
         libcdio-paranoia
         libmtp
         libmusicbrainz5
         libcddb
         taglib
         libebur128
         media-player-info
         mpg123
         #taglib-extras
         udisks2
         ffmpeg
		 kitemviews
		 karchive

        avahi gcc-libs zlib glibc
         )
makedepends=(git cmake qt6-tools vulkan-headers)
optdepends=('perl-uri: Dynamic playlist'
            'mpd: Playback')
provides=(cantata)
conflicts=(cantata)
source=("cantata-nullobsi::git+https://github.com/nullobsi/cantata.git")
sha256sums=('SKIP')

pkgver() {
  cd "cantata-nullobsi"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "cantata-nullobsi" -Wno-dev \
	-DBUNDLED_FONTAWESOME=ON \
    -DQT_DIR=/usr/lib/cmake/Qt6 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/bin

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
