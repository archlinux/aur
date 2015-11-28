# Maintainer: Fabio Rämi <fabio at dynamix-tontechnik dot ch>
pkgname=pinball-unofficial
_realname=pinball
pkgver=0.3.2
pkgrel=2
pkgdesc="The Emilia Pinball Project Unofficial version 0.3.2 with 2 new tables"
arch=('i686' 'x86_64')
url="https://github.com/sergiomb2/pinball"
license=('GPL2')
depends=('sh' 'sdl_mixer' 'sdl_image' 'mesa' 'gcc-libs')
provides=('pinball=0.3.2')
conflicts=('pinball')
options=('!makeflags' 'libtool')
source=("https://github.com/sergiomb2/${_realname}/archive/${pkgver}.tar.gz")
sha512sums=('3517f1e5535a914ef18dc7f2c7bd6c58a4635586ad5e6169b7c81927b780434f2e2ca4746a41a47cfdba44e3f1e32a1efb5a543fc16c80e256455fdbe77a5c19')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -d ${pkgdir}/usr/share/applications
  install -m644 -t ${pkgdir}/usr/share/applications/ ${_realname}.desktop
}
