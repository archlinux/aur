# Maintainer: Holger Obermaier

pkgname="dpc++"
_pkgtag="2022-09"
pkgver="${_pkgtag//-/.}"
pkgrel=1
pkgdesc="Data Parallel C++"
arch=('x86_64')
url="https://github.com/intel/llvm/releases/tag/${_pkgtag}"
license=('Apache License v2.0 with LLVM Exceptions')
depends=( 'ncurses' 'ocl-icd' 'libedit' 'libxml2' 'zlib' )
makedepends=( 'python' 'cmake' 'ninja' 'git' )
source=( "llvm::git+https://github.com/intel/llvm#tag=${_pkgtag}" )
sha256sums=( 'SKIP' )

build() {
    unset CXXFLAGS LDFLAGS CPPFLAGS CFLAGS
    export DPCPP_HOME="${srcdir}/llvm"

    # Clean old build directory
    rm -rf "${DPCPP_HOME}/build"

    python "${DPCPP_HOME}/buildbot/configure.py"
    python "${DPCPP_HOME}/buildbot/compile.py"
}

package() {
    rm    -rf "${pkgdir}/opt"
    mkdir -p  "${pkgdir}/opt"
    cp -av "${srcdir}/llvm/build/install" "${pkgdir}/opt/dpc++"
}
