# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: goetzc
# Contributor: Kim Scarborough <sluggo@unknown.nu>

pkgname=cantata-qt6
pkgver=3.3.0
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
conflicts=(cantata)
provides=(cantata)
source=("cantata-nullobsi::git+https://github.com/nullobsi/cantata.git#tag=v${pkgver}")
sha256sums=('43bd3de862b73e80e8258c27c263dd92b90bfa7f97bc8ce846a91a965fdf0690')

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
