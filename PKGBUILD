# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://codeberg.org/dptpirate/arch-ports
#
# vim: ts=2 sw=2

pkgname=lbreakouthd
pkgver=1.2.4
pkgrel=1
pkgdesc="Scalable 16:9 remake of LBreakout2"
arch=('x86_64' 'i686' 'aarch64')
url="http://lgames.sourceforge.net/LBreakoutHD/"
license=('GPL-3.0-or-later')
depends=('glibc'
         'libgcc'
         'libstdc++'
         'sdl2'
         'sdl2_ttf'
         'sdl2_image'
         'sdl2_mixer'
         'hicolor-icon-theme')
source=("https://sourceforge.net/projects/lgames/files/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4732c3852ba0030fecca65689591ac582c86af46b1a21b274640ffc6cd8fc826')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's|-Wno-format||g' configure
}

build() {
  cd "${pkgname}-${pkgver}"
  CFLAGS="${CFLAGS}" ./configure \
    --prefix="/usr" \
    --localstatedir="/var/lib/${pkgname}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}/"
  install -Dvm0644 Changelog README TODO -t \
    "${pkgdir}/usr/share/doc/${pkgname}/"
}
