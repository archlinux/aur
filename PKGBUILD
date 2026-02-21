# Maintainer: Jan Martin Reckel <jm.reckel@t-online.de>
pkgname=cantara-bin
pkgver=2.7.0
pkgrel=1
epoch=
pkgdesc="Song Presentation Software"
arch=('x86_64')
url="https://www.cantara.app"
license=('GPL3')
groups=()
conflicts=('cantara')
depends=('qt6pas')
provides=("cantara")
source=("https://github.com/reckel-jm/cantara/releases/download/v$pkgver/cantara-v$pkgver-linux-x64.zip")
md5sums=('da87d8289d93d61db517ddcd1a3be165')

package() {
    # Install binary
    install -Dm755 cantara "$pkgdir/usr/bin/cantara"

    # Generic installation for all .mo files
    # This looks into src/languages/[lang]/cantara.mo and moves it to the correct system path
    for _mo in src/languages/*/cantara.mo; do
        _lang=$(basename "$(dirname "$_mo")")
        install -Dm644 "$_mo" "$pkgdir/usr/share/locale/$_lang/LC_MESSAGES/cantara.mo"
    done

    # Install Desktop entry and Icon
    install -Dm644 app.cantara.Cantara.desktop "$pkgdir/usr/share/applications/cantara.desktop"
    install -Dm644 app.cantara.Cantara.png "$pkgdir/usr/share/icons/app.cantara.Cantara.png"
}
