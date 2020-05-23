# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=libwhereami
pkgver=0.3.1
pkgrel=3
pkgdesc='Library to report hypervisor information from inside a VM'
arch=('x86_64')
url='https://github.com/puppetlabs/libwhereami'
license=('APACHE')
depends=('boost-libs' 'gcc-libs' 'glibc' 'leatherman' 'leatherman_execution.so'
         'leatherman_file_util.so' 'leatherman_util.so' 'leatherman_logging.so'
         'leatherman_locale.so')
makedepends=('boost' 'cmake' 'rapidjson' 'curl')
checkdepends=('python')
provides=('libwhereami.so')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('89c54a945264130be0a1d662ee7e1d8756bfa84a603066fb78848049e3972d15ab5849161ca38380a45f7559dc59ed492fc6ea948ac3604096f66c6990582071')

build() {
  cd ${pkgname}-${pkgver}
  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DENABLE_CXX_WERROR=OFF \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DBUILD_SHARED_LIBS=ON
  make -C build
}

check() {
  cd ${pkgname}-${pkgver}/build
  make test
}

package() {
  cd ${pkgname}-${pkgver}

  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
