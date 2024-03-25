
#    Maintainer: J. Emiliano Deustua <edeustua@gmail.com>
# Co-maintainer: Gabriel Brown <gabriel.h.brown@gmail.com>

pkgname=chapel
pkgver=2.0.0
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
sha256sums=('b5387e9d37b214328f422961e2249f2687453c2702b2633b7d6a678e544b9a02')


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
