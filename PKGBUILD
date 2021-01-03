# Maintainer: Holger Obermaier <holger>

pkgname="dpc++"
_pkgtag="2020-12"
pkgver="${_pkgtag//-/.}"
pkgrel=1
pkgdesc="Data Parallel C++"
arch=('x86_64')
url="https://github.com/intel/llvm/releases/tag/${_pkgtag}"
license=('Apache License v2.0 with LLVM Exceptions')
depends=( 'ocl-icd' 'ncurses' 'zlib' )
makedepends=( 'python' 'cmake' 'ninja' 'git' )
source=( "llvm::git+https://github.com/intel/llvm#tag=${_pkgtag}" )
sha256sums=( 'SKIP' )

build() {
    unset CXXFLAGS LDFLAGS CPPFLAGS CFLAGS
    DPCPP_HOME="${srcdir}/llvm"
    python "${DPCPP_HOME}/buildbot/configure.py"
    python "${DPCPP_HOME}/buildbot/compile.py"
}

package() {
    mkdir -p "${pkgdir}/opt"
    mv "${srcdir}/llvm/build/install" "${pkgdir}/opt/dpc++"
}
