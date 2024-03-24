pkgname=vk-layer-flimes-gui-git
pkgver=1.5.3.r0.g4e0b6c6
pkgrel=1
pkgdesc="GUI for vk-layer-flimes external control"
arch=('x86_64')
url="https://github.com/zaps166/vk-layer-flimes-gui"
license=('MIT')
depends=('qt6-base')
makedepends=('git' 'cmake')
optdepends=('vk-layer-flimes-git')
source=("git+https://github.com/zaps166/vk-layer-flimes-gui.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/vk-layer-flimes-gui"
    git describe --long --tags | cut -c 2- | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/vk-layer-flimes-gui"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/vk-layer-flimes-gui/build"
    DESTDIR=${pkgdir} make install

    install -Dm644 "${srcdir}/vk-layer-flimes-gui/LICENSE" "$pkgdir/usr/share/licenses/vk-layer-flimes-gui/LICENSE"
}
