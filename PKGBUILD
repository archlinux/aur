# Maintainer: LekKit <github.com/LekKit>
# Intended for staging git builds with experimental features

pkgname=rvvm-git
pkgver=0.7_r1249.9bee561
pkgrel=1
pkgdesc="The RISC-V Virtual Machine"
arch=('x86_64' 'aarch64' 'riscv64' 'riscv' 'ppc' 'i386' 'i686' 'pentium4' 'arm' 'armv7h' 'armv6h')
url="https://github.com/LekKit/RVVM/"
options=(!strip staticlibs)
license=('GPL3')
depends=('libx11' 'libxext')
makedepends=('git' 'make' 'gcc')
provides=('rvvm' 'librvvm')
conflicts=('rvvm' 'librvvm')
source=("$pkgname::git+https://github.com/LekKit/RVVM.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "0.7_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    # RVVM build system knows better
    unset CFLAGS
    unset LDFLAGS
    make USE_NET=1 all lib
}

package() {
    cd $pkgname
    unset CFLAGS
    unset LDFLAGS
    make USE_NET=1 DESTDIR=$pkgdir PREFIX=/usr install
}
