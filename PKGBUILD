# Maintainer: Aetf <aetf at unlimitedcodeworks dot xyz>
pkgname=wey-bin
provides=(wey)
conflicts=(wey)
pkgver=0.3.6
pkgrel=1
pkgdesc="Fast open source Slack desktop app"
arch=(x86_64)
url="https://github.com/yue/wey"
license=('MIT')
depends=(webkit2gtk)
optdepends=(
    'libappindicator-gtk3: for tray icon'
)
source=(
    "https://github.com/yue/wey/releases/download/v${pkgver}/wey-v${pkgver}-linux-x64.zip"
    'wey.desktop'
)
sha256sums=('84e4e17ac666b2e2ea78f5b0439aab44f1c63b9ec63fe08e29b258e3f94c3e6b'
            '83d1990554d42aac8a10c456627ce7c41021737e42a3e144aad8ee17ea01be1f')
options=(!strip)

package() {
    install -d "$pkgdir/opt/wey/res"
    find "res" -type f -exec install -Dm644 -T '{}' "$pkgdir"/opt/wey/'{}' \;

    install -Dm755 "$srcdir/wey" "$pkgdir/opt/wey/wey"
    install -d "$pkgdir/usr/bin"
    ln -s /opt/wey/wey "$pkgdir/usr/bin"

    install -Dm644 "$srcdir/wey.desktop" "$pkgdir/usr/share/applications/wey.desktop"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
