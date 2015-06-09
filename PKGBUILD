# Maintainer: Olaf Bauer <hydro@freenet.de>
# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>

pkgname=noad
pkgver=0.8.6
pkgrel=2
pkgdesc="VDR addon for detecting commercials and setting cutting marks accordingly."
arch=('i686' 'x86_64')
url="http://noad.net23.net"
license=('GPL')
depends=('libmpeg2' 'ffmpeg')
makedepends=('libmpeg2' 'ffmpeg')
source=(${url}/${pkgname}-${pkgver}.tar.bz2
        noad-0.8.6-libav9.diff
        noad-0.8.6-ffmpeg-2.4.patch)
md5sums=('06b844a347c32b96c5690b0ac32739ac'
         '0b85446332f6c1babe960b4fd85f0a19'
         '212483f3e6772f1adb5efa48ccf65e95')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "$srcdir/noad-0.8.6-libav9.diff"
  patch -Np1 -i "$srcdir/noad-0.8.6-ffmpeg-2.4.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
