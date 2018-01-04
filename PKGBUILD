# Maintainer: Fabio Rämi <fabio at dynamix-tontechnik dot ch>
pkgname=pinball-unofficial
_realname=pinball
pkgver=0.3.3.3
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
sha512sums=('697ab9a66bb559c54cb43f926e1aadb36fe74cdccf69bb5e248aeeecdf48fc8ccee67655ef44fb43f5c1819946faf68e6754012b782a2a189394d0b2275a7545')

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
