# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=daggy
pkgver=2.1.3
pkgrel=1
pkgdesc='Run multiple commands on remote servers simultaneously and save output locally'
arch=('x86_64')
depends=('qt6-base' 'yaml-cpp' 'libssh2')
makedepends=('cmake')
license=('MIT')
url='https://docs.daggy.dev/'
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/synacker/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f96419b2199402eef31dd5fc8b4d15f64948bbdd350728549c890fdb8f0d2805')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DVERSION=${pkgver} -DCMAKE_INSTALL_PREFIX=/usr src
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
