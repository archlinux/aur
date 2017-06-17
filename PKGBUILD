# Contributor: josedavim <josedtascon@gmail.com>
# Maintainer: Danilo Bargen <mail at dbrgn dot ch>
pkgname=siftgpu
pkgver=0.5.400
pkgrel=4
pkgdesc="Sift Features over GPU using GLSL or CUDA"
arch=('i686' 'x86_64')
url="http://ccwu.me/"
license=('custom')
makedepends=('gcc-libs')
depends=('glew>=1.8' 'freeglut>=2.7' 'devil>=1.7')
optdepends=('cuda>=5.0')
makedepends=('git')
source=('git+https://github.com/pitzer/SiftGPU')
sha256sums=('SKIP')

folder=SiftGPU

prepare() {
  cd ${srcdir}
  sed -i "s/Glew/GLEW/" $folder/src/SiftGPU/CMakeLists.txt
}

build() {
  cd ${srcdir}
  #mkdir -p build
  #cd build
  #cmake -DSIFTGPU_ENABLE_CUDA=TRUE -DSIFTGPU_ENABLE_OPENCL=TRUE -DBUILD_SHARED_LIBS=TRUE ../${folder}
  cd ${folder}
  sed -i "s/^CUDA_INSTALL_PATH = .*$/CUDA_INSTALL_PATH = \/opt\/cuda/" makefile
  make -j1
}

package ()
{
  cd "$srcdir/$folder"
  install -Dm755 -t ${pkgdir}/usr/lib ./bin/libsiftgpu.so 
  install -Dm755 -t ${pkgdir}/usr/include ./src/$folder/SiftGPU.h
  install -Dm644 ./license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
