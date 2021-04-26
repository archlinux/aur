# Maintainer: slimb

pkgname=zsa-wally-bin
pkgver=2.1.1
pkgrel=2
pkgdesc='Flash your ZSA Keyboard the EZ way.'
arch=('i686' 'x86_64')
url='https://github.com/zsa/wally'
license=('MIT')
depends=('gtk3' 'webkit2gtk' 'libusb')
provides=('wally')
conflicts=('zsa-wally')
source=("https://github.com/zsa/wally/releases/download/${pkgver}-linux/wally"
        "https://github.com/zsa/wally/raw/${pkgver}-linux/appicon.png"
        "https://github.com/zsa/wally/raw/${pkgver}-linux/license.md"
        "https://github.com/zsa/wally/raw/${pkgver}-linux/dist/linux64/50-wally.rules"
        "https://github.com/zsa/wally/raw/${pkgver}-linux/dist/linux64/50-oryx.rules"
        "https://github.com/zsa/wally/raw/${pkgver}-linux/dist/linux64/wally.desktop"
        'udev-rules.patch'
        'desktop.patch'
)
sha256sums=('46984b397a8a3488d4982c01009795a3d6824ec97ba5fb17d52ef69751d91242'
            '81df9f24859cfd19ee8128d74a72155fe222e33349c9a647da98922f3f5b7857'
            'd2841d63f4e0bdfda102390ab1ca09136230d22f88538863b24b0c7fc68e548e'
            '269c9196bc65b2e62be549e3d34e56768fe702ff099b7780a1661ca4c92a0143'
            '6c7d4d27745080269115c58c4c5d863b23c534635975f3bca581c52687721c52'
            'd769c63305a6a4f5aa1d661826d8c475014ef8b456e60074596e940e7901c130'
            '122bd3a43cbdd395e73474979797eb7327364f3bec29f9e869f704e84da55e41'
            'a0d79d48c932c4d6c02ce8e8802dff3e888b35cb996e10a981adb839aafc2afd')

prepare() {
    patch --follow-symlinks --input="$srcdir/udev-rules.patch"
    patch --follow-symlinks --input="$srcdir/desktop.patch"
}

package() {
    install -Dm755 wally "$pkgdir/usr/bin/wally"
    install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d/" 50-oryx.rules 50-wally.rules
    install -Dm644 wally.desktop "$pkgdir/usr/share/applications/wally.desktop"
    install -Dm644 appicon.png "$pkgdir/usr/share/pixmaps/wally.png"
    install -Dm644 license.md "$pkgdir/usr/share/licenses/$pkgname/license.md"
}
