# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=libwhereami
pkgver=0.2.2
pkgrel=1
pkgdesc='Library to report hypervisor information from inside a VM'
arch=('x86_64')
url='https://github.com/puppetlabs/libwhereami'
license=('APACHE')
depends=('boost-libs')
makedepends=('boost' 'boost-libs' 'cmake' 'java-environment>=10' 'leatherman' 'curl')
checkdepends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('26f243c81ae9dae8c56aa649b6f53e4f15dcca8afb39cacf01a097de229acbdc86be930dab532c1d2a45c4e01a35c5e57acfeed36c80a236af1186548832ee9a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir build
  cd build

  cmake \
    -DENABLE_CXX_WERROR=OFF \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DBUILD_SHARED_LIBS=ON \
    ..
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
