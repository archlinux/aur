# Maintainer: Hoream <hoream@qq.com>

_pkgname=libsrm
pkgname="$_pkgname-git"
pkgver=0.7.2.1.r0.g8e69cc6
pkgrel=1
pkgdesc="A C library that simplifies the development of Linux DRM/KMS applications."
arch=('x86_64')
url="https://github.com/CuarzoSoftware/SRM"
license=('MIT')
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

