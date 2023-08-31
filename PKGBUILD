# Maintainer: taotieren <admin@taotieren.com>

pkgname=serial-studio
_pkgname=Serial-Studio
pkgver=1.1.7
pkgrel=2
pkgdesc="Multi-purpose serial data visualization & processing program"
arch=('x86_64')
url="https://github.com/Serial-Studio/Serial-Studio"
license=('MIT')
groups=()
depends=()
makedepends=("git"
    "qt6-5compat"
    "qt5-connectivity"
    "qt5-base"
    "qt5-charts"
    "qt5-serialport"
    "qt5-quickcontrols2"
    "qt5-svg"
    "libxkbcommon-x11"
    "libxcb"
    "zstd"
    )
provides=("${_pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/${pkgname}"
    git checkout -b v$pkgver v$pkgver
    git submodule update --init --recursive

}

build() {
    cd "$srcdir/${pkgname}"
    qmake-qt5 ./${_pkgname}.pro CONFIG+=[release]
    make -j$(nproc)
}

package() {
    cd "$srcdir/${pkgname}"
    make INSTALL_ROOT="$pkgdir/" install
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE*
}
