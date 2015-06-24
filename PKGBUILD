# Maintainer: jospehgbr <rafael.f.f1@gmail.com>

_pkgbase=libass
pkgname=lib32-${_pkgbase}
pkgver=0.10.1
pkgrel=1
pkgdesc="A portable library for SSA/ASS subtitles rendering (32 bit)"
arch=('x86_64')
url="http://code.google.com/p/libass/"
license=('BSD')
depends=('lib32-enca' 'lib32-fontconfig' 'lib32-fribidi' "${_pkgbase}")
makedepends=('gcc-multilib')
options=(!libtool)
source=("http://libass.googlecode.com/files/${_pkgbase}-${pkgver}.tar.xz")
md5sums=('0f54b1f3a24fa897ebbbcc5bc744b32a')

build() {
  export CC='gcc -m32'  
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32 \
        --disable-harfbuzz
  make
}

package() {
  make -C ${_pkgbase}-${pkgver} DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s ${_pkgbase} "${pkgdir}"/usr/share/licenses/${pkgname}
}
