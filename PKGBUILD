# Maintainer: Ramdan Olii <developer@nyanpixel.my.id>

pkgname=rplayer-bin
pkgver=1.1
pkgrel=2
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
source=(
    "IDR-Spectrum-Player-x86_64.AppImage::https://github.com/ramdanolii14/Rplayer/releases/download/v${pkgver}/IDR-Spectrum-Player-x86_64.AppImage"
    "id.ramdanolii.idrspectrum.svg::https://github.com/ramdanolii14/Rplayer/releases/download/v${pkgver}/id.ramdanolii.idrspectrum.svg"
    "id.ramdanolii.idrspectrum.desktop::https://github.com/ramdanolii14/Rplayer/releases/download/v${pkgver}/id.ramdanolii.idrspectrum.desktop"
)
sha256sums=(
    '8b9d58159de3b864861e7a013277680c3f27657f11723b857658f59635ba6cab'
    '4572e3790c327dd1e1166f583e781950187b6caa7a2fac2fb12c9f38d4c61d7b'  # sha256sum id.ramdanolii.idrspectrum.svg
    '45b821b358e3c6046b39b3aadaaec5e73959c077e10317b8520fe9a0088720bc'  # sha256sum id.ramdanolii.idrspectrum.desktop
)

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
