# Maintainer: Lee Stripp <leestripp@gmail.com>
pkgname=lucidvideo
pkgver=0.4.0
pkgrel=1
pkgdesc="Intelligent video library with AI-powered search and semantic understanding"
arch=('x86_64')
url="https://gitlab.com/leestripp/lucid"
license=('MIT')
depends=('gtk4' 'libadwaita' 'gstreamer1.0-libav' 'gstreamer1.0-plugins-base' 'gstreamer1.0-plugins-good' 'sqlite3' 'curl' 'json-glib')
makedepends=('cmake' 'ninja' 'gcc' 'pkg-config')
optdepends=()
provides=('lucidvideo')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/leestripp/lucid/-/archive/${pkgver}/lucid-${pkgver}.tar.gz")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
    cd "${srcdir}/lucid-${pkgver}"
    
    # Create build directory
    mkdir -p build
    cd build
    
    # Configure with CMake (Release mode)
    cmake .. \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
        
    # Build
    ninja
}

package() {
    cd "${srcdir}/lucid-${pkgver}/build"
    
    # Install binary
    install -Dm755 lucid "${pkgdir}/usr/bin/lucid"
    
    # Install desktop file
    install -Dm644 "${srcdir}/lucid-${pkgver}/data/lucid.desktop" \
        "${pkgdir}/usr/share/applications/lucidvideo.desktop"
    
    # Install icon
    install -Dm644 "${srcdir}/lucid-${pkgver}/resources/icons/lucid-app.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lucidvideo.svg"
}
