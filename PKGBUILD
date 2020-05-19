# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=arcade-learning-environment
pkgver=0.6.1
pkgrel=3
pkgdesc='The Arcade Learning Environment (ALE) is a simple object-oriented framework that allows researchers and hobbyists to develop AI agents for Atari 2600 games'
arch=('x86_64')
url="https://github.com/mgbellemare/Arcade-Learning-Environment"
license=('GPL2')
depends=('sdl' 'zlib' 'gcc-libs')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8059a4087680da03878c1648a8ceb0413a341032ecaa44bef4ef1f9f829b6dde')

prepare() {
  cd "${srcdir}/Arcade-Learning-Environment-${pkgver}"
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  cmake -DUSE_SDL=ON -DUSE_RLGLUE=OFF -DBUILD_EXAMPLES=ON  -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
  cd "${srcdir}/Arcade-Learning-Environment-${pkgver}/build"
  make -j `nproc`
}

package() {
  cd "${srcdir}/Arcade-Learning-Environment-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et: