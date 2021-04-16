# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus
pkgver=0.11.0
pkgrel=1
pkgdesc="Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL3')
conflicts=('weylus-bin')
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/archive/v$pkgver.zip")
sha256sums=('8f015e86233549d735457b65c568a71194fecdef7348e916a7b37b5fa919ce17')

makedepends=(rust typescript gcc libx11 pkg-config git make cmake)

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
