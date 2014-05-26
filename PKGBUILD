# $Id: PKGBUILD 86926 2013-03-24 22:42:26Z lcarlier $
# Upstream Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

pkgname=libx32-libffi
pkgver=3.0.13
pkgrel=1
pkgdesc="A portable, high level programming interface to various calling conventions (x32 ABI)"
arch=('x86_64')
license=('MIT')
url="http://sourceware.org/libffi/"
depends=('libx32-glibc')
checkdepends=('dejagnu')
options=('!libtool')
source=(
ftp://sourceware.org/pub/libffi/libffi-${pkgver}.tar.gz
)
sha1sums=('f5230890dc0be42fb5c58fbf793da253155de106')

build() {
  cd "${srcdir}/libffi-${pkgver}"

  export CC="gcc -mx32"

  ./configure --prefix=/usr \
    --libdir=/usr/libx32 --libexecdir=/usr/libx32 \
    --disable-static --host=x86_64-unknown-linux-gnux32

  make
}

check() {
  cd "${srcdir}/libffi-${pkgver}"

  make check
}

package() {
  cd "${srcdir}/libffi-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
  rm -r "${pkgdir}"/usr/share/{info,man}
}
