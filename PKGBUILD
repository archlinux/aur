# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
pkgname=coccoc-browser-stable
_pkgname=coccoc-browser
pkgver=140.0.7339.250
pkgrel=3
_pkgrel=1
pkgdesc="The web browser from Coc Coc. Coc Coc is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=('x86_64')
url="https://coccoc.com"
license=('custom')
depends=('ca-certificates'
    'ttf-liberation'
    'alsa-lib'
    'atk'
    'at-spi2-core'
    'glibc'
    'cairo'
    'libcups'
    'curl'
    'dbus'
    'expat'
    'mesa'
    'glib2'
    'gtk3'
    'nspr'
    'nss'
    'pango'
    'systemd'
    'vulkan-icd-loader'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'wget'
    'xdg-utils'
)
conflicts=('coccoc-browser')
options=('!strip' '!emptydirs')
install=${pkgname}.install

# validgpgkey='5DA62E7F05A744B437D54C1A414816EB7B41FA4B'
source=(
    "https://browser-linux.coccoc.com/deb/pool/main/${pkgname}_${pkgver}-${_pkgrel}_amd64.deb"
    # "https://browser-linux.coccoc.com/deb/public.gpg"
    "LICENSE.html::https://coccoc.com/termsofuse"
)
sha256sums=(
    '54f1216130f200e3cd16d529af47fe79755dc1662758d4ee88d065c7592042b2'
    # '6119c4e31caf078f03f9ce5a2cf301646abcb78a687a70d28bdae9901c478300'
    'SKIP'
)

package() {
    tar -xJf data.tar.xz -C "$pkgdir"
    rm -r "$pkgdir"/etc

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/coccoc/browser/coccoc-browser" "$pkgdir/usr/bin/coccoc-browser"

    local icon_sizes=(16 24 32 48 64 128 256)
    for size in "${icon_sizes[@]}"; do
        install -Dm644 "$pkgdir/opt/coccoc/browser/product_logo_${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/coccoc-browser.png"
    done
    # Install 32x32 XPM icon
    install -Dm644 "$pkgdir/opt/coccoc/browser/product_logo_32.xpm" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/coccoc-browser.xpm"

    install -Dm644 "LICENSE.html" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.html"
    chmod -R go-w "$pkgdir"
}