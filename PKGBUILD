# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=libb64
pkgver=1.2
pkgrel=1
pkgdesc='Base64 Encoding/Decoding Routines'
url='http://libb64.sourceforge.net/'
depends=('glibc')
arch=('i686' 'x86_64')
license=('custom:Public Domain')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.src.zip")
md5sums=('a609809408327117e2c643bed91b76c5')

build() {
  cd ${pkgname}-${pkgver}/src
  export CFLAGS="${CFLAGS} -fPIC"
  make

  export CFLAGS="${CFLAGS} -shared -Wl,-soname,${pkgname}.so.0"
  gcc ${LDFLAGS} ${CFLAGS} *.o -o ${pkgname}.so.0
}

package() {
  cd ${pkgname}-${pkgver}

  install -d "${pkgdir}/usr/lib"
  install src/libb64.so.0 "${pkgdir}/usr/lib"
  ln -sf /usr/lib/libb64.so.0 "${pkgdir}/usr/lib/libb64.so"

  cp -r include "${pkgdir}/usr"

  install -Dm644 LICENSE \
      "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
