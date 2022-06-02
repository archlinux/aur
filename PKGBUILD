# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Stephen Caraher <moskvax@gmail.com>

_pkgname=libiec61883
pkgname=lib32-${_pkgname}
pkgver=1.2.0
pkgrel=3
pkgdesc="A higher level API for streaming DV, MPEG-2 and audio over Linux IEEE 1394 (32 bit)"
arch=('x86_64')
url="https://www.kernel.org/pub/linux/libs/ieee1394/"
license=('LGPL')
depends=('lib32-libraw1394' "${_pkgname}")
source=("https://www.kernel.org/pub/linux/libs/ieee1394/${_pkgname}-${pkgver}.tar.xz")
sha512sums=('817177081a229c6253340e5911369aab746bd657d5b3d6a1ef3cf639cceee667bdb677fb0536163468cc9e719c4e81c6beaf42c93e5a56eb52684964b6dd1e23')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
