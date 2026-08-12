# Maintainer: RyaninCn11 <me@ryanincn11.me>
options=(!strip !debug)
pkgname=bilup-bin
provides=('bilup')
conflicts=('bilup' 'bilup-git')
pkgver=2.0.0
pkgrel=1
pkgdesc='TurboWarp mod with Chinese translations and live collaboration.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/Bilup/'
license=('GPL3')
depends=('alsa-lib' 'gtk3' 'nss' 'libxss' 'xdg-utils' 'hicolor-icon-theme')
source_x86_64=("bilup-${pkgver}-x86_64.deb::https://github.com/Bilup/Desktop/releases/download/v2.0.0/Bilup-linux-amd64-${pkgver}.deb")
source_armv7h=("bilup-${pkgver}-armv7h.deb::https://github.com/Bilup/Desktop/releases/download/v2.0.0/Bilup-linux-armv7l-${pkgver}.deb")
source_aarch64=("bilup-${pkgver}-aarch64.deb::https://github.com/Bilup/Desktop/releases/download/v2.0.0/Bilup-linux-arm64-${pkgver}.deb")
sha256sums_x86_64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')

build() {
    cd "$srcdir"

    case "$CARCH" in
        x86_64)  debfile="bilup-${pkgver}-x86_64.deb" ;;
        aarch64) debfile="bilup-${pkgver}-aarch64.deb" ;;
        armv7h)  debfile="bilup-${pkgver}-armv7h.deb" ;;
    esac
    bsdtar -xf "$debfile"
    bsdtar -xf data.tar.xz
}

package() {
    cp -r "$srcdir/opt" "$pkgdir"
    cp -r "$srcdir/usr" "$pkgdir"
    if [ ! -L "$pkgdir/usr/bin/Bilup-desktop" ]; then
        install -d "$pkgdir/usr/bin"
        ln -sf '/opt/Bilup/Bilup-desktop' "$pkgdir/usr/bin/Bilup-desktop"
    fi
}
