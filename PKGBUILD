# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: montag451 <montag451 [at] laposte (dot) net>

pkgname=asn1c
pkgver=0.9.28
pkgrel=2
pkgdesc='Open Source ASN.1 Compiler'
arch=('i686' 'x86_64')
url='https://github.com/vlm/asn1c'
license=('BSD')
depends=('perl')
makedepends=('pandoc')
source=("https://github.com/vlm/asn1c/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('bb9d913ead074d59886652a681fb2cae3ac363beeb4ecdccf2b23753ed04a0dfa453f658a529c5c38eb34be8b90f322750f97513cd0a53b8541faa2f5b3da073')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m 644 -D -t "${pkgdir}/usr/share/${pkgname}/standard-modules" skeletons/standard-modules/*
  install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
