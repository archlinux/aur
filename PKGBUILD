# Maintainer: Olaf Bauer <hydro@freenet.de>
# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>

pkgname=noad
pkgver=0.8.6
pkgrel=3
pkgdesc="VDR addon for detecting commercials and setting cutting marks accordingly."
arch=('i686' 'x86_64')
url="https://github.com/madmartin/noad"
license=('GPL')
depends=('libmpeg2' 'ffmpeg')
makedepends=('libmpeg2' 'ffmpeg')
source=(${url}/archive/v${pkgver}.tar.gz
        'noad-0.8.6-ffmpeg3.4.diff')

md5sums=('4dedaa1b9a1ef3dcb4830a9f945707a1'
         '9e7c3540e0e0e1a1153c9a8b5da93422')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "$srcdir/noad-0.8.6-ffmpeg3.4.diff"
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
