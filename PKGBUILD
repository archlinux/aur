# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libxaw
pkgname=lib32-${_pkgbase}
pkgver=1.0.14
pkgrel=1
pkgdesc="X11 Athena Widget library (32 bit)"
arch=('x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('lib32-libxmu' 'lib32-libxpm' "${_pkgbase}")
makedepends=('xorg-util-macros' 'gcc-multilib')
options=('!libtool')
source=("${url}/releases/individual/lib/libXaw-${pkgver}.tar.bz2")
sha512sums=('29d1c151369523ae6cb418e636b0b7b39ccccc35462a0b394dbeb46d5b6d780badd2eb872a55d9fbba1ee1af034e76c0463f40f8d8a7be2c336d08b3b1bf81d4')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd libXaw-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib32 --disable-static
  make
}

package() {
  cd libXaw-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
  
  install -d m755 "${pkgdir}"/usr/share/licenses/
  ln -s ${_pkgbase} "${pkgdir}"/usr/share/licenses/${pkgname}
}
