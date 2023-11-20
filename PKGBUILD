# Maintainer: Hoream <hoream@qq.com>

_pkgname=srm
pkgname="$_pkgname-git"
pkgver=0.3.2.2.r0.g68283d0
pkgrel=1
pkgdesc="A C library that simplifies the development of Linux DRM/KMS applications."
arch=('x86_64')
url="https://github.com/CuarzoSoftware/SRM"
license=('GPL3')
depends=('libglvnd' 'libdrm' 'mesa' 'libdisplay-info' 'libinput' 'seatd' 'glibc' 'systemd-libs')
makedepends=('git' 'meson' 'ninja')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
options=()
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver () {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
    cd "$srcdir/$_pkgname/src"
    mkdir -p build
    arch-meson build
    ninja -C build
}

package() {
    cd "$srcdir/$_pkgname/src"
    DESTDIR="${pkgdir}/" ninja -C build install
}

