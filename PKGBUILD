# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

pkgname=lbreakouthd
pkgver=1.1.3
pkgrel=1
pkgdesc="Scalable 16:9 remake of LBreakout2"
arch=('i686' 'x86_64' 'aarch64')
url="http://lgames.sourceforge.net/LBreakoutHD/"
license=('GPL3')
makedepends=('automake')
depends=('sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer')
source=("https://downloads.sourceforge.net/project/lgames/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('069179f377f689fe05789d858bff06658ba1e53dfb19774dabf5b0e0b33ae706')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cp $(ls -td /usr/share/automake-* | head -n1)/config.guess .
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
