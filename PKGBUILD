# Maintainer: Lee Stripp <leestripp@gmail.com>
pkgname=lucidvideo
pkgver=0.4.1
pkgrel=1
pkgdesc="Intelligent video library with AI-powered search and semantic understanding"
arch=('x86_64')
url="https://gitlab.com/leestripp/lucidvideo"
license=('MIT')
depends=('gtk4' 'libadwaita' 'sqlite3' 'curl' 'json-glib' 'gst-libav' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('cmake' 'ninja' 'gcc' 'pkg-config')
provides=('lucidvideo')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/leestripp/lucidvideo/-/archive/v${pkgver}/lucidvideo-${pkgver#v}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/lucidvideo-${pkgver#v}"
    mkdir -p build
    cd build
    cmake .. \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja
}

package() {
    cd "${srcdir}/lucidvideo-${pkgver#v}/build"
    install -Dm755 lucidvideo "${pkgdir}/usr/bin/lucidvideo"
    install -Dm644 "${srcdir}/lucidvideo-${pkgver#v}/data/lucid.desktop" \
        "${pkgdir}/usr/share/applications/lucidvideo.desktop"
    install -Dm644 "${srcdir}/lucidvideo-${pkgver#v}/resources/icons/lucid-app.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lucidvideo.svg"
}
