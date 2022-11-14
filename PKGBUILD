# Maintainer: taotieren <admin@taotieren.com>

pkgbase=lc2kicad-git
pkgname=lc2kicad-git
pkgver=alpha.0.1.6.r39.g9fe34d8
pkgrel=1
pkgdesc="A utility that converts EasyEDA files to KiCad files"
arch=('x86_64' 'i686' 'arm')
url="https://github.com/RigoLigoRLC/LC2KiCad"
license=('LGPL-3.0')
groups=()
provides=(LC2KiCad)
conflicts=(${pkgbase%-git})
replaces=()
depends=()
makedepends=(git cmake ninja)
optdepends=('kicad: Electronic schematic and printed circuit board (PCB) design tools')
backup=()
options=('!strip')
install=
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
    git describe --long --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"

    cmake  -DCMAKE_INSTALL_PREFIX=/usr/bin \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
}
