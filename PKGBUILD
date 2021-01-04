# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=libxls
pkgver=1.6.2
pkgrel=1
pkgdesc='Read binary Excel files from C/C++'
arch=('i686' 'x86_64')
url='https://github.com/libxls/libxls'
license=('BSD')
depends=('glibc')
makedepends=('autoconf-archive')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/libxls/libxls/archive/v${pkgver}.tar.gz")
sha512sums=('9eb8dc78d9070ebe5af2629a358cea0f41db9e4accdfc2651093eaffaaeff5595e986346fa41a3b57740234f4a70d5aa394e5234f90e94ba41a782de574e4d00')

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
