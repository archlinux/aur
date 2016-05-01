# Maintainer:  rubenvb <vanboxem.ruben@gmail.com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=clfft
pkgver=2.12.0
pkgrel=1
pkgdesc="A software library containing FFT functions written in OpenCL"
arch=("i686" "x86_64")
url="https://github.com/clMathLibraries/clFFT"
license=('APACHE')
depends=('libcl')
makedepends=('opencl-headers' 'cmake')
checkdepends=('fftw' 'gtest')

source=("https://github.com/clMathLibraries/clFFT/archive/v${pkgver}.tar.gz")
sha512sums=('8ee21847f2877989a1b6a62f62807e2cfd6d6845ed36702de775eb9dbccfed898e9969cce7bb93827745b5d65a5d91aaf07c565c92e65b6fefe3028efa9c23c9')

if [ "$CARCH" == "x86_64" ]; then
_bits=64
elif [ "$CARCH" == "i686" ]; then
_bits=32
fi

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "../clFFT-${pkgver}/src" #-DBUILD_TEST=true 
  make
}

check() {
  cd "${srcdir}/build"
  #./staging/Test
}

package() {
  cd "${srcdir}/build"
  make install DESTDIR=${pkgdir}
  rm -rf "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/lib${_bits}" "${pkgdir}/usr/lib"
  rm "${pkgdir}/usr/lib/libStatTimer.so"
}
