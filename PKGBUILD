
#    Maintainer: J. Emiliano Deustua <edeustua@gmail.com>
# Co-maintainer: Gabriel Brown <gabriel.h.brown@gmail.com>

pkgname=chapel
pkgver=1.31.0
pkgrel=3
pkgdesc="Programming language designed for productive parallel computing at scale"
url="https://chapel-lang.org/"
arch=('x86_64' 'arm')
license=('Apache')
# depends=('python' 'perl' 'llvm' 'clang')
depends=('python' 'perl' 'llvm15' 'llvm15-libs' 'clang15') # if using old versions
makedepends=('git' 'cmake')
source=("https://github.com/chapel-lang/chapel/releases/download/${pkgver}/chapel-${pkgver}.tar.gz")
sha256sums=('4b861c9a354f6fcf66081256f7ec703d6dd2cd68ea363b400d10ac00bf308679')
            

build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        # if depending on old versions like llvmXX and clangXX
        export CHPL_TARGET_CPU="native"
        export CHPL_HOST_COMPILER="clang"
        export CHPL_HOST_CC="/usr/lib/llvm15/bin/clang"
        export CHPL_HOST_CXX="/usr/lib/llvm15/bin/clang++"
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
