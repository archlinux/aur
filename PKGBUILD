# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: goetzc
# Contributor: Kim Scarborough <sluggo@unknown.nu>

pkgname=cantata-qt6
pkgver=3.3.1
pkgrel=1
pkgdesc="Qt6 graphical client for Music Player Daemon (MPD), nullobsi fork"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/nullobsi/cantata"
license=(GPL3)
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

        avahi gcc-libs zlib glibc
         )
makedepends=(git cmake qt6-tools)
optdepends=('perl-uri: Dynamic playlist'
            'mpd: Playback')
provides=(cantata)
conflicts=(cantata)
source=("cantata-nullobsi::git+https://github.com/nullobsi/cantata.git#tag=v${pkgver}")
sha256sums=('c282fd13610e6521696a9caaa5772952b16a9ff2a64192fdc379d9074ebdb96c')

build() {
  cmake -B build -S "cantata-nullobsi" -Wno-dev \
    -DQT_DIR=/usr/lib/cmake/Qt6 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/bin

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
