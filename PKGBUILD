# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Upstream Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

pkgname=libx32-libffi
pkgver=3.0.11
pkgrel=1.1
pkgdesc="A portable, high level programming interface to various calling conventions (x32 ABI version)"
arch=('x86_64')
license=('MIT')
url="http://sourceware.org/libffi"
depends=('libx32-glibc')
checkdepends=('dejagnu')
options=('!libtool')
source=(
ftp://sourceware.org/pub/libffi/libffi-${pkgver}.tar.gz
189626.patch
)
md5sums=(
'f69b9693227d976835b4857b1ba7d0e3'
'e01126c78cefe99498ff1e04fa728a2b'
)

build() {
  cd "${srcdir}/libffi-${pkgver}"

  patch -p2 -i ${srcdir}/189626.patch

  export CC="gcc -mx32"

  ./configure --prefix=/usr \
    --libdir=/usr/libx32 --libexecdir=/usr/libx32

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
