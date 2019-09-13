# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=libwhereami
pkgver=0.2.2
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('26f243c81ae9dae8c56aa649b6f53e4f15dcca8afb39cacf01a097de229acbdc86be930dab532c1d2a45c4e01a35c5e57acfeed36c80a236af1186548832ee9a')

build() {
  cd ${pkgname}-${pkgver}

  mkdir -p build
  cd build

  cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DENABLE_CXX_WERROR=OFF \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DBUILD_SHARED_LIBS=ON \
    ..
  make
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
