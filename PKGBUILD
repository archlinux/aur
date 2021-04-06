# Maintainer: robertfoster
# Contributor: LIN Rs <LinRs[d]users.noreply.github.com>
# Contributor: yochananmarqos <mark.wagie at tutanota dot com>

_pkgname=devilutionX
pkgname=devilutionx
pkgver=1.2.0
pkgrel=1
pkgdesc="Diablo devolved for linux"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('graphite' 'libsodium' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('cmake' 'gcc-libs')
install="${pkgname}".install
options=('strip')
source=("${url}/archive/${pkgver}.tar.gz")

prepare() {
  cd "${srcdir}/${_pkgname}-$pkgver"
  if [ -d build ]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBINARY_RELEASE=ON \
    -DVERSION_NUM="${pkgver}"

  cmake --build .
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  DESTDIR=${pkgdir} \
    cmake --install .
}

sha256sums=('63a06043b60a5866933eafcc078052e7f6a5878757c451fe74efb141b94386ac')
