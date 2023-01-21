# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Jitang Zheng <jitang dot zheng at gmail dot com>

pkgname=google-fruit
pkgver=3.7.1
pkgrel=1
pkgdesc="Fruit, a dependency injection framework for C++."
arch=('i686' 'x86_64' 'pentium4' 'i486')
url="https://github.com/google/fruit"
license=('Apache')
depends=('gcc-libs')
makedepends=('boost' 'cmake')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/google/fruit/archive/v${pkgver}.tar.gz")
sha256sums=('ed4c6b7ebfbf75e14a74e21eb74ce2703b8485bfc9e660b1c36fb7fe363172d0')

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
  cmake \
    -DBUILD_SHARED_LIBS=on \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFRUIT_USES_BOOST=on \
    ../fruit-${pkgver}

  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
