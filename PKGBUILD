# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=libxls
pkgver=1.5.2
pkgrel=1
pkgdesc='Read binary Excel files from C/C++'
arch=('i686' 'x86_64')
url='https://github.com/libxls/libxls'
license=('BSD')
depends=('glibc')
makedepends=('autoconf-archive')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/libxls/libxls/archive/v${pkgver}.tar.gz")
sha512sums=('d3809f74d6548f4e227dcd764a98fef92c98e85374d715a31c2e205ba3bf2d9d8dc325e3c7d3e02f36d6c01e3ac4c3854dea16e23d32474c2f6316ff645cadc8')

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
