# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=snap7
pkgver=1.4.2
pkgrel=3
pkgdesc="Step7 Open Source Ethernet Communication Suite"
url="http://snap7.sourceforge.net/"
license=("LGPL3")
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
source=("https://downloads.sourceforge.net/project/snap7/${pkgver}/${pkgname}-full-${pkgver}.7z")
sha256sums=('1f4270cde8684957770a10a1d311c226e670d9589c69841a9012e818f7b9f80e')
    
case "$CARCH" in
    armv6h)
        _pkgarch="arm_v6"
        ;;
    armv7h)
        _pkgarch="arm_v7"
        ;;
    i686)
        _pkgarch="i386"
        ;;
    x86_64)
        _pkgarch="x86_64"
        ;;
esac

build() {
  cd "${srcdir}/${pkgname}-full-${pkgver}/build/unix/"
  make -f ${_pkgarch}_linux.mk all
}

package() {
  cd "${srcdir}/${pkgname}-full-${pkgver}/build/"

  install -D -m755 "bin/${_pkgarch}-linux/libsnap7.so" "${pkgdir}/usr/lib/libsnap7.so"
}
