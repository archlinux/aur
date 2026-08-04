# Maintainer: 9m2pju <9m2pju@hamradio.my>

# This is an unofficial package. VarAC is proprietary software developed by
# Irad Deutsch 4Z1AC. Its license permits distribution only through the official
# VarAC website (varac-hamradio.com). The PKGBUILD therefore downloads the ZIP
# from the official redirect URL and does not redistribute the binary.

pkgname=varac-bin
pkgver=15.0.18
pkgrel=1
pkgdesc="VarAC - HF digital chat messenger for amateur radio (Wine)"
arch=('x86_64')
url="https://www.varac-hamradio.com"
license=('custom')
depends=('wine' 'wine-mono')
makedepends=('unzip')
optdepends=('winetricks: additional Wine configuration tools'
            'vara-hf: VARA HF modem (must be installed separately and authorized)')
source=("$pkgname-$pkgver.zip::https://varac-hamradio.com/download-varac-zip-package"
        "varac.sh"
        "varac.desktop")
sha256sums=('e8ea382a80bbea70ef9a03e16e949ebdf7da2906518479e14919b4b032e0dab0'
            '7a38c8789f2f6ebfff3744da6441c7af3ebc6683afb00172168814f8af7c795d'
            '7130bf3b7909806121827ec11eca6469c2d20e9e8773615f3bfff8e0502192b6')

package() {
    install -d "$pkgdir/usr/share/varac"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/licenses/$pkgname"

    unzip -q "$srcdir/$pkgname-$pkgver.zip" -d "$pkgdir/usr/share/varac"

    install -Dm644 "$pkgdir/usr/share/varac/License.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/License.txt"

    install -Dm755 "$srcdir/varac.sh" "$pkgdir/usr/bin/varac"
    install -Dm644 "$srcdir/varac.desktop" \
        "$pkgdir/usr/share/applications/varac.desktop"
}
