# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

pkgname=lbreakouthd
pkgver=1.0.8
pkgrel=1
pkgdesc="Scalable 16:9 remake of LBreakout2"
arch=('i686' 'x86_64')
url="http://lgames.sourceforge.net/LBreakoutHD/"
license=('GPL3')
depends=('sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer')
source=("https://downloads.sourceforge.net/project/lgames/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ed5c19259938e7c73e7e7ce905a31d0ba647fc08cf291735b227f871131d148c')

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
