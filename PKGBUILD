# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Michael Cooper <mythmon at gmail dot com>

# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.

# THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
# OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

pkgname=zsa-keymapp-bin
_pkgname=keymapp
pkgver=1.3.7
pkgrel=1
pkgdesc="A live visual reference for your ZSA keyboard"
arch=(x86_64)
url="https://zsa.io/flash"
license=(custom:not-provided)
depends=(libusb gtk3)
depends=(zsa-udev libusb gtk3 webkit2gtk-4.1)
# ZSA does not seem to provide a proper versioned download for keymapp, so just grab the latest one.
# If the checksum fails we know there's a new version.
source=("${pkgname}-${pkgver}.tar.gz::https://oryx.nyc3.cdn.digitaloceanspaces.com/keymapp/keymapp-latest.tar.gz"
        'keymapp.desktop')
sha256sums=('a87bc7083cd6461ba10e0da4b94f249a29100d712542d54498f01e947cf868fa'
            '798667e23dfc74f6a4c65f7ecb9838dec4987a2c4224fe9bb38e85cb2d2ad861')

package() {
    install -Dm0755 "${srcdir}/keymapp" "${pkgdir}/usr/bin/keymapp"
    install -Dm0644 -t "${pkgdir}/usr/share/applications/" "${srcdir}/keymapp.desktop" 
    install -Dm0644 "${srcdir}/icon.png"  "${pkgdir}/usr/share/pixmaps/keymapp.png"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    echo "No license information provided" > "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
