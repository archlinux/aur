# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=horde3d
pkgver=1.0beta5
pkgrel=1
pkgdesc='A lightweight next-generation 3D rendering and animation engine.'
url='http://www.horde3d.org/'
license=('EPL')
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libgl')
makedepends=('cmake' 'mesa')
source=("Horde3D-482a4c2afb.tar.gz::https://github.com/horde3d/Horde3D/archive/482a4c2afb.tar.gz")
sha1sums=('ad8ed0038bc7d7f3d20e42ba7a9677a54d7ac11d')

build()
{
  mkdir -p ${srcdir}/build && cd ${srcdir}/build
  
  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_C_FLAGS="${CFLAGS/-O2/-Ofast}" \
    -D CMAKE_CXX_FLAGS="${CXXFLAGS/-O2/-Ofast}" \
    ../Horde3D-482a4c2afb

  make
}

package()
{
  cd ${srcdir}/build

  make install DESTDIR=${pkgdir}

  cd ${srcdir}/Horde3D-482a4c2afb

  install -Dm755 Horde3D/Binaries/Linux/ColladaConv ${pkgdir}/usr/bin/ColladaConv
}
