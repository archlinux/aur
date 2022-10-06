# Maintainer: hexchain <i at hexchain dot org>

pkgname=vulkan-caps-viewer
pkgver=3.25
_pkgver_tag=${pkgver}_fixed
pkgrel=1
pkgdesc="Vulkan hardware capability viewer"
url=https://github.com/SaschaWillems/VulkanCapsViewer
license=(GPL2)
arch=(x86_64)
source=("https://github.com/SaschaWillems/VulkanCapsViewer/archive/refs/tags/${_pkgver_tag}/${pkgname}-${pkgver}.tar.gz")
makedepends=("vulkan-headers>=1.3.226")
depends=(vulkan-icd-loader qt5-x11extras qt5-wayland hicolor-icon-theme)

build() {
    cd "$srcdir"
    mkdir build
    cd build

    qmake ../VulkanCapsViewer-${_pkgver_tag} \
        DEFINES+="X11 WAYLAND" \
        QMAKE_CFLAGS="$CFLAGS" \
        QMAKE_CXXFLAGS="$CXXFLAGS" \
        QMAKE_LFLAGS="$LDFLAGS" \
        PREFIX=/usr
    make
}

package() {
    cd "$srcdir/build"
    make INSTALL_ROOT="$pkgdir" install

    install -Dm644 "${srcdir}"/VulkanCapsViewer-${_pkgver_tag}/gfx/android_icon_256.png \
        "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
sha256sums=('2c2366a00820d9eeebd2db68f85e0f889bd92e988a73ecdee4e723bb179638be')
