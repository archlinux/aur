# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=libwhereami
pkgver=0.5.0
pkgrel=16
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
sha512sums=('e9a0332f4ec0a2e6201cdf6212f2f1ced5a948e94aaa638c8d8a69f7306828b6168924775788b31316eecab59377a5ebd9310293e8e708e418c68fe47b248c13')

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
