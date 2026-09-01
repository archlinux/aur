# Maintainer: Alex Indigo <ai@aegis.one>

pkgname=luch
pkgver=0.2.0
pkgrel=1
pkgdesc="Link router for Linux/Wayland — pick which browser opens a URL"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/luch"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'layer-shell-qt' 'qt6-xdgiconqml'
         'qt6-wayland' 'hicolor-icon-theme')
makedepends=('cmake' 'wayland-protocols')
optdepends=('wl-clipboard: Ctrl+C copy survives the popup exiting')
conflicts=('luch-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ec9fff613f6e6cf64ec6de26cc0c2b458bcc016741cb858a81dc512a4f03f800')

build() {
    cmake -B build -S "${srcdir}/${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
