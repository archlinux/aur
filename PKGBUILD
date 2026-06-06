# Maintainer: Ramdan Oli <developer@nyanpixel.my.id>
pkgname=chawa-whatsapp-web-client
pkgver=1.0
pkgrel=1
pkgdesc="WhatsApp Web client based on GTK4 and WebKitGTK"
arch=('x86_64')
url="https://github.com/ramdanolii14/Chawa-Whatsapp-Web-Client"
license=('GPL-3.0-or-later')
depends=(
    'gtk4'
    'webkitgtk-6.0'
    'libnotify'
    'libva'
    'libva-mesa-driver'
    'mesa'
    'gstreamer'
    'gst-plugins-bad'
    'gst-plugin-va'
)
makedepends=(
    'meson'
    'ninja'
    'pkg-config'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

_reponame="Chawa-Whatsapp-Web-Client"

build() {
    cd "$_reponame-$pkgver"
    meson setup build \
        --prefix=/usr \
        --buildtype=release \
        --optimization=3 \
        -Dstrip=true
    ninja -C build
}

package() {
    cd "$_reponame-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
}
