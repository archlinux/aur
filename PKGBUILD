# Contributor: Lex Black <autumn-wind@web.de>

pkgname=pg-gvm
pkgver=22.6.12
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
sha512sums=('c1f3738fb3b85e40b30d12c8e1eadc731010582ed50607bea5d97273e915d1e9f8ca2965bf6ea53312c35fd147492156b6c32cee9871004ed7f90d537629721a'
            'SKIP'
            '724ad7720f6ce75747b26478e27fad18b678af6361b4c1a5fe5bb6563265d7db78761b74995c04ea57ad78fb9fd0408d237440f04958bebc03bd6cddb2432481')
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
