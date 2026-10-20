# Maintainer: temidaradev <temidaradev@proton.me>
#
# pkgver / pkgrel / sha256sums are rewritten by scripts/publish-aur.sh at
# release time (from the release branch). Edit the package body here, not those.
pkgname=kopuz-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="A modern music player (pre-built binary)"
arch=('x86_64')
url="https://github.com/Kopuz-org/kopuz"
provides=('kopuz')
conflicts=('kopuz')
license=('EUPL-1.2')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libsoup3'
    'glib-networking'
    'alsa-lib'
    'openssl'
    'xdotool'
    'dbus'
    'opus'
    'libayatana-appindicator'
)

optdepends=(
    'ffmpeg: converting YouTube downloads to MP3, FLAC or WAV'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/Kopuz-org/kopuz/releases/download/v${pkgver}/kopuz_v${pkgver}_x86_64-linux.tar.gz")
sha256sums=('6fd2079f49a7e9c8fb85d39be1947339b0304e69e0a8ba99529cdf00c0b872eb')

package() {
    cd "kopuz-linux-x86_64"

    install -Dm755 kopuz "$pkgdir/usr/bin/kopuz"

    install -Dm644 "moe.kopuz.kopuz.desktop" \
        "$pkgdir/usr/share/applications/moe.kopuz.kopuz.desktop"
    sed -i "s|Exec=kopuz|Exec=/usr/bin/kopuz|" \
        "$pkgdir/usr/share/applications/moe.kopuz.kopuz.desktop"

    install -Dm644 "logo.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/moe.kopuz.kopuz.png"

    install -Dm644 "moe.kopuz.kopuz.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/moe.kopuz.kopuz.metainfo.xml"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
