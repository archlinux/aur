# Author: WujekFoliarz
# Maintainer: x7k3e21 <uly4nkin.denis@gmail.com>

_pkgname=DualSenseY-v2
pkgname=${_pkgname,,}
pkgver=58
pkgrel=1
pkgdesc="A program for DualSense controllers that combines power and simplicity"
arch=('x86_64')
url="https://github.com/WujekFoliarz/DualSenseY-v2"
license=('unknown')
depends=('libappindicator-gtk3' 'openssl' 'glibc' 'gcc-libs')
makedepends=('cmake' 'make' 'gcc')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f15ae591f71b421910b0cb6dbe60bb64ef45169cbd707ac4a37088e288995a37')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cmake -B build -S . -DCMAKE_CXX_FLAGS=""
    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
    install -D -t "${pkgdir}/usr/local/bin/" "${srcdir}/${_pkgname}-${pkgver}/build/DualSenseY"
    install -D -m644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Name=DualSenseY-v2
Comment=A program for DualSense controllers that combines power and simplicity
Exec=DualSenseY
Terminal=false
Type=Application
Categories=Utility;Game;
EOF
}