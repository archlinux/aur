# Maintainer:  rubenvb <vanboxem.ruben@gmail.com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=clfft
pkgver=2.4
pkgrel=2
pkgdesc="A software library containing FFT functions written in OpenCL"
arch=("i686" "x86_64")
url="https://github.com/clMathLibraries/clFFT"
license=('APACHE')
depends=('libcl')
makedepends=('opencl-headers' 'cmake')
checkdepends=('fftw' 'gtest')

source=("https://github.com/clMathLibraries/clFFT/archive/v${pkgver}.tar.gz")
md5sums=('32f1c5e18d0827550a96ac5f0d369120')
sha512sums=('3450f3ee962e1722c765e962178c57df0bf298508603ac5b4ec12bd6396dc10279136d5b91383b9da56d95cebd0e552bf78e2c01ccaeb8cd43ed947b7d536209')

if [ "$CARCH" == "x86_64" ]; then
_bits=64
elif [ "$CARCH" == "i686" ]; then
_bits=32
fi

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  echo `pwd`
  cmake -DCMAKE_BUILD_TYPE=Release "../clFFT-${pkgver}/src"
  make
}

check() {
  cd "${srcdir}/build"
  make check
}

package() {
  cd "${srcdir}/build"
  make install DESTDIR=${pkgdir}/usr
  rm -rf "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/lib${_bits}" "${pkgdir}/usr/lib"
  rm "${pkgdir}/usr/lib/libStatTimer.so"
} 
