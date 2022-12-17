# Maintainer: badcast <lmecomposer@gmail.com>

_pkgbase="sample-cmake"
pkgname=${_pkgbase}-git
pkgver=1.0
pkgrel=0
url="https://github.com/badcast/sample-cmake"
pkgdesc="Sample from cmake project, Export and Import data. How to compile & run?"
arch=(x86_64 i686)
license=('GPL3')
depends=('gcc')
makedepends=('cmake' 'gcc' 'make' 'coreutils' 'git')
source=("git+https://github.com/badcast/sample-cmake.git")
md5sums=('SKIP')

build(){
   cd "${srcdir}/${_pkgbase}"
   echo ${srcdir}
   cmake -DSYSLIB=1 -DCMAKE_BUILD_TYPE=Release -B ./build
   cd ./build
   cmake --build . -j $(nproc)

}

package(){
   cd "${pkgdir}"
   mkdir -p "${pkgdir}/usr/bin/"
   mkdir -p "${pkgdir}/usr/lib/"
   install -Dm755 "${srcdir}/${_pkgbase}/build/sample_bin" "${pkgdir}/usr/bin/"
   install -Dm655 "${srcdir}/${_pkgbase}/build/libsample_lib.so" "${pkgdir}/usr/lib/"
}
