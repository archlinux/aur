# Maintainer: KnownGecko <KnownGeckom@protonmail.com>
# Forked From: Hoream <hoream@qq.com>

_cdname=SRM
_realname="libsrm"
pkgname="libsrm-devel-git"
pkgver=0.7.2.1.r20.g6608abd
pkgrel=1
pkgdesc="A C library that simplifies the development of Linux DRM/KMS applications."
arch=('x86_64')
url="https://github.com/CuarzoSoftware/SRM/"
license=('MIT')
depends=('libglvnd' 'libdrm' 'mesa' 'libdisplay-info' 'libinput' 'seatd' 'glibc' 'systemd-libs')
makedepends=('git' 'meson' 'ninja')
optdepends=()
provides=("$_realname")
conflicts=("$_realname")
replaces=()
options=()
source=(git+https://github.com/CuarzoSoftware/SRM.git#branch=devel)
sha256sums=(SKIP)

pkgver () {
    cd "$srcdir/$_cdname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
    cd "$srcdir/$_cdname/src"
    mkdir -p build
    arch-meson build
    ninja -C build
}

package() {
    cd "$srcdir/$_cdname/src"
    DESTDIR="${pkgdir}/" ninja -C build install
}

