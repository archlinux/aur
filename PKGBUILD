# Maintainer: Ramdan Olii<developer@nyanpixel.my.id>

pkgname=rplayer-bin
pkgver=1.1
pkgrel=1
pkgdesc="Pemutar musik audio native untuk Arch Linux dengan visualisasi spektrum dan grafik kurs IDR"
arch=('x86_64')
url="https://github.com/ramdanolii14/Rplayer"
license=('GPL-3.0-only')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'gstreamer'
    'gst-python'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-plugins-ugly'
    'gst-libav'
    'fuse2'
)
options=('!strip')
source=("IDR-Spectrum-Player-x86_64.AppImage::https://github.com/ramdanolii14/Rplayer/releases/download/v${pkgver}/IDR-Spectrum-Player-x86_64.AppImage")
sha256sums=('8b9d58159de3b864861e7a013277680c3f27657f11723b857658f59635ba6cab')

package() {
    install -Dm755 "IDR-Spectrum-Player-x86_64.AppImage" \
        "$pkgdir/usr/lib/$pkgname/rplayer.AppImage"
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/rplayer" << 'WRAPPER'
#!/usr/bin/env bash
exec /usr/lib/rplayer-bin/rplayer.AppImage "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/rplayer"
    install -Dm644 "id.ramdanolii.idrspectrum.desktop" \
        "$pkgdir/usr/share/applications/id.ramdanolii.idrspectrum.desktop"
    install -Dm644 "id.ramdanolii.idrspectrum.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/id.ramdanolii.idrspectrum.svg"
}