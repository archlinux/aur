# Maintainer: LekKit <github.com/LekKit>

pkgname=rvvm
pkgver=0.5_r957.76796ba
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
source=("$pkgname::git+https://github.com/LekKit/RVVM.git#branch=v0.5-release")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "0.5_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    # RVVM build system knows better
    unset CFLAGS
    unset LDFLAGS
    make all lib
}

package() {
    cd $pkgname
    unset CFLAGS
    unset LDFLAGS
    make DESTDIR=$pkgdir PREFIX=/usr install
}
