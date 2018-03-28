# Contributor: josedavim <josedtascon@gmail.com>
# Maintainer: Danilo Bargen <mail at dbrgn dot ch>
pkgname=siftgpu
pkgver=0.5.400
pkgrel=6
pkgdesc="Sift Features over GPU using GLSL or CUDA"
arch=('i686' 'x86_64')
url="http://ccwu.me/"
license=('custom')
depends=('glew>=1.8' 'freeglut>=2.7' 'devil>=1.7')
optdepends=('cuda>=5.0')
makedepends=(git)
source=("${pkgname}::git+https://github.com/pitzer/SiftGPU"
        'makefile-cuda.patch')
sha256sums=('SKIP'
            '9f3ce3d74180d34bc2c787811a6552cb996b950d808466bc74e3194253721288')


prepare() {
  cd ${srcdir}/${pkgname}
  patch -Np1 -i ../makefile-cuda.patch
  #sed -i 's:g++:g++-5:' makefile
}

build() {
  cd ${srcdir}/${pkgname}
  #mkdir -p build
  #cd build
  #cmake -DSIFTGPU_ENABLE_CUDA=TRUE -DSIFTGPU_ENABLE_OPENCL=TRUE -DBUILD_SHARED_LIBS=TRUE ../${pkgname}
  make -j1
}

package ()
{
  cd ${srcdir}/${pkgname}
  install -Dm755 -t ${pkgdir}/usr/lib ./bin/libsiftgpu.so 
  install -Dm755 -t ${pkgdir}/usr/include ./src/SiftGPU/SiftGPU.h
  install -Dm644 ./license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
