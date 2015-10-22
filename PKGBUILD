# Contributor: josedavim <josedtascon@gmail.com>
# Maintainer: Danilo Bargen <mail at dbrgn dot ch>
pkgname=siftgpu
pkgver=0.5.400
pkgrel=3
pkgdesc="Sift Features over GPU using GLSL or CUDA"
arch=('i686' 'x86_64')
url="http://cs.unc.edu/~ccwu/siftgpu/"
license=('custom')
makedepends=('gcc-libs')
depends=('glew>=1.8' 'freeglut>=2.7' 'devil>=1.7')
optdepends=('cuda>=5.0')
source=('http://wwwx.cs.unc.edu/~ccwu/cgi-bin/siftgpu.cgi')
sha256sums=('5d3272e02e4b65ad3abf2286529f93954403a22437baa5afbcfe43220640f16c')

if [ "${CARCH}" = "x86_64" ]; then
  _platform=x64
else
  _platform=x86
fi

folder=SiftGPU

build() {
  cd "$srcdir/$folder"
  sed -i "s/^CUDA_INSTALL_PATH = .*$/CUDA_INSTALL_PATH = \/opt\/cuda/" makefile
  make -j1
}

package ()
{
  cd "$srcdir/$folder"
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include
  cp -a ./bin/libsiftgpu.so ./bin/libsiftgpu.a $pkgdir/usr/lib
  cp -a ./src/$folder/SiftGPU.h $pkgdir/usr/include
  install -Dm644 ./license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
