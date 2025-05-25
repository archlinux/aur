# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=daggy
pkgver=2.2.0
pkgrel=1
pkgdesc='Run multiple commands on remote servers simultaneously and save output locally'
arch=('x86_64')
depends=('qt6-base' 'yaml-cpp' 'libssh2')
makedepends=('cmake')
license=('MIT')
url='https://daggy.gitbook.io/docs'
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/synacker/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5f813c1619167d3bd981c811ee0afca4b59140a659b41602737fdfb7b66e182e')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DVERSION=${pkgver}.0 -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON src
  cmake --build .
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
