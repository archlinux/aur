# Maintainer Denis Demidov <dennis.demidov@gmail.com>
pkgname=oclgrind-git
pkgver=20170518
pkgrel=1
pkgdesc="A SPIR interpreter and virtual OpenCL device simulator."
arch=("any")
url="https://github.com/jrprice/Oclgrind"
makedepends=("cmake")
depends=("clang" "llvm")
license=("BSD")

source=("https://github.com/jrprice/Oclgrind/archive/master.zip")

md5sums=("SKIP")

pkgver() {
    date +%Y%m%d
}

build() {
    cd "${srcdir}/Oclgrind-master"
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DLIBDIR_SUFFIX="" \
          . -Bbuild
    cmake --build build
}

package() {
    cd "${srcdir}/Oclgrind-master/build"
    VERBOSE=1 DESTDIR=${pkgdir} make install
    install -m755 -d ${pkgdir}/etc/OpenCL/vendors
    install -m644 oclgrind.icd ${pkgdir}/etc/OpenCL/vendors
}

