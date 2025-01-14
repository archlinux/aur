
#    Maintainer: J. Emiliano Deustua <edeustua@gmail.com>
# Co-maintainer: Gabriel Brown <gabriel.h.brown@gmail.com>

pkgname=chapel
pkgver=2.3.0
pkgrel=1
pkgdesc="Programming language designed for productive parallel computing at scale"
url="https://chapel-lang.org/"
arch=('x86_64' 'arm')
license=('Apache')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
depends=('python' 'perl' 'llvm' 'clang')
# depends=('python' 'perl' 'llvm16' 'llvm16-libs' 'clang16') # if using old versions
makedepends=('git' 'cmake')
options=('!debug' '!lto')  # build currently fails from default flags these add
source=("https://github.com/chapel-lang/chapel/releases/download/${pkgver}/chapel-${pkgver}.tar.gz")
sha256sums=('0185970388aef1f1fae2a031edf060d5eac4eb6e6b1089e7e3b15a130edd8a31')


build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        # if depending on old versions like llvmXX and clangXX
        # export CHPL_TARGET_CPU="native"
        # export CHPL_HOST_COMPILER="clang"
        # export CHPL_HOST_CC="/usr/lib/llvm16/bin/clang"
        # export CHPL_HOST_CXX="/usr/lib/llvm16/bin/clang++"
        ./configure --prefix=/usr
        make
}

check() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        export PATH="$srcdir/${pkgname}-${pkgver}/bin/linux64-x86_64:$PATH"
        make check
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        make DESTDIR="${pkgdir}" install
}
