# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus
pkgver=0.11.4
pkgrel=2
pkgdesc="Use your tablet as graphic tablet/touch screen on your computer."
arch=("x86_64")
url="https://github.com/H-M-H/Weylus"
license=("AGPL3")
conflicts=("weylus-bin")
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/archive/v$pkgver.zip" "linking.patch")
sha256sums=("9cc838e6406ea763c448e64775c42a8faf62a43e63a14facfbdbe0704336e4f8" "SKIP")

makedepends=(rust typescript gcc libx11 pkg-config git make cmake)

prepare() {
    cd "Weylus-$pkgver"
    git apply < ../linking.patch
}

build() {
    cd "Weylus-$pkgver"
    cargo build --release --features="ffmpeg-system"
}

package() {
    cd "Weylus-$pkgver"
    install -vDm755 "target/release/weylus" "$pkgdir/usr/bin/weylus"
    install -vDm755 "weylus.desktop" "${pkgdir}/usr/share/applications/weylus.desktop"
}

depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite libdrm libva ffmpeg dbus gst-plugins-base-libs)
optdepends=("gst-plugin-pipewire: Wayland support")
