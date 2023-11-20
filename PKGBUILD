# Maintainer: Hoream <hoream@qq.com>

_pkgname=louvre 
pkgname="$_pkgname-git"
pkgver=1.0.1.1.r0.g8af9d09
pkgrel=1
pkgdesc="A high-performance C++ library designed for building Wayland compositors with a strong emphasis on ease of development."
arch=('x86_64')
url="https://github.com/CuarzoSoftware/Louvre"
license=('GPL3')
depends=('srm' 'wayland' 'libglvnd' 'libxcursor' 'libxkbcommon' 'pixman' 'libdrm' 'mesa' 'libinput' 'seatd' 'glibc' 'freeimage' 'fontconfig' 'freetype2' 'icu' 'systemd-libs')
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

