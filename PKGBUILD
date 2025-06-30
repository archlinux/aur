# Maintainer: LekKit <github.com/LekKit>
# Intended for staging git builds with experimental features

pkgname=rvvm-git
pkgver=v0.7.git.r2178.gecd433b
pkgrel=1
pkgdesc="The RISC-V Virtual Machine"
arch=('x86_64' 'aarch64' 'riscv64' 'riscv' 'ppc' 'i386' 'i686' 'pentium4' 'arm' 'armv7h' 'armv6h')
url="https://github.com/LekKit/RVVM/"
options=(!strip)
license=('GPL3' 'MPL2')
depends=('libx11' 'libxext' 'wayland' 'libxkbcommon')
makedepends=('git' 'make' 'gcc')
provides=('rvvm' 'librvvm')
conflicts=('rvvm' 'librvvm')
source=("$pkgname::git+https://github.com/LekKit/RVVM.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "$(git describe --tags --abbrev=0).r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" | sed 's/-/./g'
}

build() {
    cd $pkgname
    make USE_LIB_SHARING=1
}

package() {
    cd $pkgname
    make USE_LIB_SHARING=1 DESTDIR=$pkgdir install
}
