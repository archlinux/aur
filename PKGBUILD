# Maintainer: KnownGecko <KnownGecko@protonmail.com>
# Forked From: Hoream <hoream@qq.com>

_realname="louvre"
_cdname="Louvre" 
pkgname="louvre-devel-git"
pkgver=2.9.0.1.r7.gee157b9
pkgrel=1
pkgdesc="A high-performance C++ library designed for building Wayland compositors with a strong emphasis on ease of development."
arch=('x86_64')
url="https://github.com/CuarzoSoftware/Louvre"
license=('MIT')
depends=('libsrm-devel-git' 'wayland' 'libglvnd' 'libxcursor' 'libxkbcommon' 'pixman' 'libdrm' 'mesa' 'libinput' 'seatd' 'glibc' 'freeimage' 'fontconfig' 'freetype2' 'icu' 'systemd-libs')
makedepends=('git' 'meson' 'ninja')
optdepends=()
provides=("$_realname")
conflicts=("$_realname")
replaces=()
options=()
source=(git+https://github.com/CuarzoSoftware/Louvre.git#branch=devel)
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

