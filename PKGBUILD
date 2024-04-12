# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

pkgname=lbreakouthd
pkgver=1.1.7
pkgrel=1
pkgdesc="Scalable 16:9 remake of LBreakout2"
arch=('i686' 'x86_64' 'aarch64')
url="http://lgames.sourceforge.net/LBreakoutHD/"
license=('GPL3')
makedepends=('automake')
depends=('sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer')
source=("https://downloads.sourceforge.net/project/lgames/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8af813f3260414ae24109922963dcd3f838eda6064936671e88f8495d7b44e41')

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
