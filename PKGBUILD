# Contributor: Lex Black <autumn-wind@web.de>

pkgname=pg-gvm
pkgver=22.6.10
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
sha512sums=('4f270d0dcb53043a1ab666b17bff97ede9ac635789ca7f1ba65206aef76c83d9ab284f1223b10d604e90b3d796a21949a72cdc07038502b246ef2b1539086d48'
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
