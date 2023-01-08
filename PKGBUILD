# Maintainer: Keinv Yue <yuezk001@gmail.com>

_pkgver="1.4.8+28snapshot.g4a3f74f"
_commit="4a3f74f1c3049e3cf03c262c1d49057c2eafb34e"
pkgname=globalprotect-openconnect-git
pkgver=${_pkgver}
pkgrel=1
pkgdesc="A GlobalProtect VPN client (GUI) for Linux based on Openconnect and built with Qt5, supports SAML auth mode. (development version)"
arch=(x86_64 aarch64)
url="https://github.com/yuezk/GlobalProtect-openconnect"
license=('GPL3')
backup=(
    etc/gpservice/gp.conf
)
install=gp.install
depends=('openconnect>=8.0.0' qt5-base qt5-webengine qt5-websockets qt5-tools qtkeychain-qt5)
makedepends=(git cmake)
conflicts=('globalprotect-openconnect')
provides=('globalprotect-openconnect' 'gpclient' 'gpservice')

source=(git+https://github.com/yuezk/GlobalProtect-openconnect#commit=${_commit})
sha256sums=('SKIP')

prepare() {
    cd GlobalProtect-openconnect
    echo "${_pkgver}" > VERSION
}

build() {
    cd GlobalProtect-openconnect
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_FLAGS_RELEASE=-s
    make -j$(nproc) -C build
}

package() {
    cd GlobalProtect-openconnect
    make DESTDIR="$pkgdir/" install -C build
}
