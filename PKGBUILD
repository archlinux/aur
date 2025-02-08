# Contributor: Lex Black <autumn-wind@web.de>

pkgname=pg-gvm
pkgver=22.6.7
pkgrel=2
pkgdesc='Greenbone Library for helper functions in PostgreSQL'
arch=('x86_64')
url="https://github.com/greenbone/pg-gvm"
license=('GPL-3.0-only')
depends=('gvm-libs' 'glib2' 'libical' 'postgresql')
makedepends=('cmake' 'doxygen' 'xmltoman' 'libxslt')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        ${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc
        0001_not-sbin.patch)
sha512sums=('9dd6f49832503fd6713193991fcc90f6ee55e9c05f0cff7635f37f922ecdd26d830b257fd93073379a6568bc86b6aaba2650cd721c73ae6956fd958b8757d3c9'
            'SKIP'
            'fad85369efd8ebcc0c72928328e25b239a227ca014ba2f0d237cf70286d2e6ee62193a02e268895a53493d198852b01b43dd8cdae553225fcfa0159b7369eb91')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity


prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np2 -i "${srcdir}/0001_not-sbin.patch"
}

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_DEV_PREFIX=/usr
  make -C build
}

package() {
  make DESTDIR="${pkgdir}/" -C build install
}
