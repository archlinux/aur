# Maintainer: Fabio Rämi <fabio at dynamix-tontechnik dot ch>
pkgname=pinball-unofficial
_realname=pinball
pkgver=0.3.3
pkgrel=1
pkgdesc="The Emilia Pinball Project Unofficial version 0.3.2 with 2 new tables"
arch=('i686' 'x86_64')
url="https://github.com/sergiomb2/pinball.old"
license=('GPL2')
depends=('sh' 'sdl_mixer' 'sdl_image' 'mesa' 'gcc-libs')
provides=('pinball=0.3.1')
conflicts=('pinball')
options=('!makeflags' 'libtool')
source=("https://github.com/sergiomb2/${_realname}.old/archive/${pkgver}.tar.gz")
sha512sums=('7bdadf505774b694da16ad9fb34e76ac32c888cf482068b19caa7c616fe456bf705366d7737d24f346ab064a4ff6e9fc4b98fe14be9699479ca3ff8a0d127cde')

build() {
  cd "${srcdir}/${_realname}.old-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_realname}.old-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -d ${pkgdir}/usr/share/applications
  install -m644 -t ${pkgdir}/usr/share/applications/ ${_realname}.desktop
}
