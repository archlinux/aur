# Maintainer: Jan Stephan <jan.stephan.dd@gmail.com>

pkgname=lib32-xcb-util-renderutil
_basename=xcb-util-renderutil
pkgver=0.3.9
pkgrel=1
pkgdesc="Utility libraries for XC Binding - Convenience functions for the Render extension (32-bit)"
arch=('x86_64')
url="https://xcb.freedesktop.org"
license=('custom')
depends=('libxcb>=1.7' 'xcb-util-renderutil')
makedepends=('xorg-util-macros')
source=("https://xcb.freedesktop.org/dist/${_basename}-${pkgver}.tar.bz2"
        'LICENSE')
sha256sums=('c6e97e48fb1286d6394dddb1c1732f00227c70bd1bedb7d1acabefdd340bea5b'
            'ded299aa179dcf0d885bf89274a4db77a530e03f9f5e7cf1c3c4ef1d60e914b9')

build() {
  export CC='cc -m32'
  export CXX='c++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${_basename}-${pkgver}
  ./configure --prefix=/usr --disable-static --build=i686-pc-linux-gnu --libdir=/usr/lib32
  make
}

check() {
  cd ${_basename}-${pkgver}
  make check
}

package() { 
  cd ${_basename}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/include

  install -D -m644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
