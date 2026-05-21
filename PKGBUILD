# Maintainer: Tokit Auhid <tokitauhidmim12@gmail.com>

pkgname=synkromium-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Keep your Chromium browser settings and extensions in sync across all your devices, privately and automatically."
arch=('x86_64')
url="https://github.com/tokitauhid/Synkromium"
license=('MIT')
depends=('nss' 'libxss' 'libsecret' 'gtk3' 'alsa-lib')
provides=('synkromium')
conflicts=('synkromium')
source=("${pkgname}-${pkgver}.deb::https://github.com/tokitauhid/Synkromium/releases/download/v${pkgver}/synkromium_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    # The .deb file is automatically extracted by makepkg into $srcdir,
    # which gives us data.tar.xz. Extract it to $pkgdir.
    tar xf data.tar.xz -C "$pkgdir"

    # Ensure standard permissions
    chmod -R u-s,g-s,o-w,a+rX "$pkgdir"

    # Create a symlink in /usr/bin
    install -d "$pkgdir/usr/bin"
    ln -sf "/opt/Synkromium/synkromium" "$pkgdir/usr/bin/synkromium"
}
