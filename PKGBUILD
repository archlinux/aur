# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=libxls
pkgver=1.6.3
pkgrel=2
pkgdesc='Read binary Excel files from C/C++'
arch=('i686' 'x86_64')
url='https://github.com/libxls/libxls'
license=('BSD')
depends=('glibc')
makedepends=('autoconf-archive')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/libxls/libxls/archive/v${pkgver}.tar.gz") 
sha512sums=('44967976a054d3bd2759b98304c02155b586abad8405b54d2a4f0c86bc16613d7bf83608f0330c90f5ab70ed08a22e63f2c6f5888f3fb2a255c21ff54f77057b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fvi -I /usr/share/gettext/m4
#  patch -p0 < ../../xlstypes.patch #fix xlstypes include bug
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static \
    --program-prefix=lib # fix conflict with catdoc package
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
