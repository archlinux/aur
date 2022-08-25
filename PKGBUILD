# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

pkgname=lbreakouthd
pkgver=1.0.10
pkgrel=1
pkgdesc="Scalable 16:9 remake of LBreakout2"
arch=('i686' 'x86_64')
url="http://lgames.sourceforge.net/LBreakoutHD/"
license=('GPL3')
depends=('sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer')
source=("https://downloads.sourceforge.net/project/lgames/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8651a13daf75bbaa4e699a052520dc5d841d8b34c58eeb932e7c7d7dcad75210')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i 's|-Wno-format||g' configure
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CFLAGS="${CFLAGS}" ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
