# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
pkgname=coccoc-browser-stable
_pkgname=coccoc-browser
pkgver=142.0.7444.230
pkgrel=1
_pkgrel=1
pkgdesc="The web browser from Coc Coc. Coc Coc is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=('x86_64')
url="https://coccoc.com"
license=('custom')
depends=(
    'ttf-liberation'
    'alsa-lib'
    'libcups'
    'gtk3'
    'nss'
    'libxss'
    'libxtst'
    'xdg-utils'
    'sh'
)
optdepends=(
    'pipewire: WebRTC desktop sharing under Wayland'
    'kdialog: for file dialogs in KDE'
    'gnome-keyring: for storing passwords in GNOME keyring'
    'libunity: for download progress on KDE'
    'kwallet: for storing passwords in KWallet'
)
provides=('coccoc-browser' 'coccoc')
conflicts=('coccoc-browser' 'coccoc')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source=(
    "https://browser-linux.coccoc.com/deb/pool/main/${pkgname}_${pkgver}-${_pkgrel}_amd64.deb"
    "coccoc-browser-stable"
    "LICENSE.html"
)
sha256sums=(
    'bd697ad32ffc80db5b0a5d764487c7dc9632e371432b9fe29959851d6a5d45de'
    'fae326b92e97b28dafc9e1ed3958486bb0455cb5cebe3cad3484f92bde30b804'
    '22bf4605260a7432eee169b0afbfae6782b9812c2bc776fdc1a887f6e2b10ec6'
)

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"

    # Launcher
    install -m755 coccoc-browser-stable "$pkgdir/usr/bin/coccoc-browser-stable"

    local icon_sizes=(16 24 32 48 64 128 256)
    for size in "${icon_sizes[@]}"; do
        install -Dm644 "$pkgdir/opt/coccoc/browser/product_logo_${size}.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/coccoc-browser.png"
        rm "$pkgdir/opt/coccoc/browser/product_logo_${size}.png"
    done

    install -Dm644 LICENSE.html "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.html"
    chmod -R go-w "$pkgdir"
    rm -r "$pkgdir/etc/cron.daily/" "$pkgdir/opt/coccoc/browser/cron/"
}
