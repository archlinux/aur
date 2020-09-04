# Maintainer: Fabio Rämi <fabio at dynamix-tontechnik dot ch>
pkgname=pinball-unofficial
_realname=pinball
pkgver=0.3.4
pkgrel=1
pkgdesc="The Emilia Pinball Project unofficial version with 2 new tables"
arch=('i686' 'x86_64')
url="https://github.com/sergiomb2/pinball"
license=('GPL2')
depends=('sdl_mixer' 'sdl_image' 'mesa' 'gcc-libs')
provides=('pinball=0.3.1')
conflicts=('pinball')
options=('!makeflags' 'libtool')
source=("https://github.com/sergiomb2/${_realname}/archive/${pkgver}.tar.gz")
sha512sums=('a0f3d0fe765c51715db25a1d874a4d55f4213cdad780730f1b870bd840749cba146dbd6744c95b0c28551d32b7cf95ab82dfabb682b196a4192ac0ccf4bf7385')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  autoreconf -i
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  make clean
  install -d ${pkgdir}/usr/share/applications
  install -m644 -t ${pkgdir}/usr/share/applications/ ${_realname}.desktop
}
