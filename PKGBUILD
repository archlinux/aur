# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=libxls
pkgver=1.6.1
pkgrel=1
pkgdesc='Read binary Excel files from C/C++'
arch=('i686' 'x86_64')
url='https://github.com/libxls/libxls'
license=('BSD')
depends=('glibc')
makedepends=('autoconf-archive')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/libxls/libxls/archive/v${pkgver}.tar.gz")
sha512sums=('241a233c9a275fa69eb4fab565be2d320d74f2a0d3c30866fbf0bee89edc062c353c7bdfee2e75663cb7283a5470dd8d83ef1a4708918218e1d00742ddc28a8c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fiv
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
