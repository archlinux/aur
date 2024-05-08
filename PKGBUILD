# Maintainer: ccicnce113424 <ccicnce113424@gmail.com>

pkgbase=sentakki
pkgname=('sentakki-bin' 'sentakki-i18n')
pkgver=2024.413.0
pkgrel=1
pkgdesc="An attempt to recreate maimai gameplay within osu!lazer."
arch=('any')
url="https://github.com/LumpBloom7/sentakki"
license=('MIT')
depends=('osu-lazer')
makedepends=('unzip')
provides=('sentakki')
conflicts=('sentakki')
_url="$url/releases/download/${pkgver}"
source=("$_url/osu.Game.Rulesets.Sentakki.dll"
        "$_url/sentakki-language-packs.zip"
        "LICENSE.md")
noextract=("osu.Game.Rulesets.Sentakki.dll"
           "sentakki-language-packs.zip")
sha256sums=("c923b7b71592e65a1e5c1f6f03424aa5ce1779033e3cd7cc83138ba3910ee02d"
            "c22fff5f4e1d4758e9a53cfc7b30f20c8f12d3dbd459c39766fd734f4976c970"
            "SKIP")

package_sentakki-bin() {
    install -Dm644 "$srcdir/osu.Game.Rulesets.Sentakki.dll" "$pkgdir/opt/osu-lazer/osu.Game.Rulesets.Sentakki.dll"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

package_sentakki-i18n() {
    # options and directives that can be overridden
    pkgdesc="Language pack for sentakki."
    depends=('sentakki' 'osu-lazer')
    provides=()
    conflicts=()

    install -d "$pkgdir/opt/osu-lazer"
    unzip "$srcdir/sentakki-language-packs.zip" -d "$pkgdir/opt/osu-lazer" > /dev/null
    # cp -r "$srcdir/sentakki-language-packs/*" "$pkgdir/opt/osu-lazer"
    chown root:root -R "$pkgdir/opt/osu-lazer"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

}
