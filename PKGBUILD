# Maintainer: Nomadcxx <nomadcxx@gmail.com>
pkgname=gslapper
pkgver=1.0.0
pkgrel=1
pkgdesc="gSlapper, a GStreamer-based video wallpaper application that replaces mpvpaper with better NVIDIA & Wayland support"
arch=('x86_64')
url="https://github.com/Nomadcxx/gSlapper"
license=('MIT')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'wayland')
makedepends=('meson' 'ninja' 'gcc' 'pkgconf' 'wayland-protocols')
optdepends=('gst-plugins-ugly: Additional codec support'
            'gst-libav: Additional codec support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8087d3b13e1b67c6055551dcf5ebf085908ce65c9cff6ee77066199c50e70da5')

prepare() {
    cd "${srcdir}/gSlapper-${pkgver}"
}

build() {
    cd "${srcdir}/gSlapper-${pkgver}"
    meson setup build --prefix=/usr --buildtype=release
    ninja -C build
}


package() {
    cd "${srcdir}/gSlapper-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}