# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libxaw
pkgname=lib32-${_pkgbase}
pkgver=1.0.13
pkgrel=1
pkgdesc="X11 Athena Widget library (32 bit)"
arch=('x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('lib32-libxmu' 'lib32-libxpm' "${_pkgbase}")
makedepends=('xorg-util-macros' 'gcc-multilib')
options=('!libtool')
source=("${url}/releases/individual/lib/libXaw-${pkgver}.tar.bz2")
sha256sums=('8ef8067312571292ccc2bbe94c41109dcf022ea5a4ec71656a83d8cce9edb0cd')

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
