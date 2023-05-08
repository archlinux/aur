
#    Maintainer: J. Emiliano Deustua <edeustua@gmail.com>
# Co-maintainer: Gabriel Brown <gabriel.h.brown@gmail.com>

pkgname=chapel
pkgver=1.30.0
pkgrel=3
pkgdesc="Programming language designed for productive parallel computing at scale"
url="https://chapel-lang.org/"
arch=('x86_64' 'arm')
license=('Apache')
depends=('python' 'perl' 'llvm14' 'llvm14-libs' 'clang14') # depend on 14s temporarily
makedepends=('git' 'cmake' 'base-devel')
source=("https://github.com/chapel-lang/chapel/releases/download/${pkgver}/chapel-${pkgver}.tar.gz")
sha256sums=('8d933f4b6e497d9699a14deedd222e18c77c523483957d66201731d0d94285d2')
            

build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        export CHPL_TARGET_CPU="native"
        export CHPL_HOST_COMPILER="clang"
        export CHPL_HOST_CC="/usr/lib/llvm14/bin/clang"
        export CHPL_HOST_CXX="/usr/lib/llvm14/bin/clang++"

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
