# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=libwhereami
pkgver=0.3.0
pkgrel=1
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
sha512sums=('6ba398b7c2889d41757e5cc77be1e6b86c3ad3cec59432adb5debb39d37ee1b01aa12871944d27c5af7e5abff9f1b8e59d43f16730b91fb39212ec83967cc2c8')

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
