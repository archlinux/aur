# Maintainer: evorster <evorster@gmail.com>

pkgname=v3d-flow-builder-git
pkgver=rev.116
pkgrel=1
pkgdesc="The V3D Flow Builder is a GPU based tool that calculates the optical flow between two input images."
arch=('i686' 'x86_64')
url="https://github.com/slowmoVideo/v3d-flow-builder"
license=('GPL')
depends=('libpng' 'libjpeg-turbo' 'glew')
makedepends=('cmake' 'git')
provides=('v3d-flow-builder')
conflicts=('v3d-flow-builder')
source=('git+https://github.com/slowmoVideo/v3d-flow-builder.git')
md5sums=('SKIP')
#install=$pkgname.install

prepare(){
  cd "${srcdir}"/v3d-flow-builder
  git submodule update --init
  cd "${srcdir}"
  mkdir -p build
}

pkgver() {
  cd "${srcdir}"/v3d-flow-builder
  echo "rev.$(git rev-list --count HEAD)"
}

build() {
  cd "${srcdir}"/build
  export LDFLAGS="-lX11 ${LDFLAGS}"
  cmake ../v3d-flow-builder -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
