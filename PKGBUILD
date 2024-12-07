# Contributor: Lex Black <autumn-wind@web.de>

pkgname=pg-gvm
pkgver=22.6.6
pkgrel=1
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
sha512sums=('062136a2940160b8295f36ec8936be90a3161b311d6632eed87a5c1cff2aca6a43ebe00ba3376a74beabd117ac3fe8fbedc767a4df6bfa5f26e5f3839a4f5ebf'
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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_DEV_PREFIX=/usr
  make -C build
}

package() {
  make DESTDIR="${pkgdir}/" -C build install
}
