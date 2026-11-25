pkgname=nekokolpa2
pkgver=2.7.0
pkgrel=608
pkgdesc='Cross-platform eSIM management app for working with local eUICCs, external readers, and remote reader endpoints'
arch=(x86_64)
url='https://github.com/iebb/NekokoLPA2'
license=(MIT)
depends=(gtk3 ccid pcsclite)
options=(!debug)
makedepends=(imagemagick)
source=("https://github.com/iebb/NekokoLPA2/releases/download/v${pkgver}%2B${pkgrel}/ee.nekoko.nlpa2.linux-${pkgver}-${pkgrel}-x64.tar.gz")
sha256sums=('545ef1220bdbdf73bdcc02f73dcf740591b4e32a782a564379f6ab996f30e429')

package() {
    install -Dm755 "${startdir}/nlpa2.sh" "${pkgdir}/usr/bin/nlpa2"
    install -Dm644 "${startdir}/ee.nekoko.nlpa2.desktop" "${pkgdir}/usr/share/applications/ee.nekoko.nlpa2.desktop"
    install -Dm755 "${srcdir}/nlpa2" "${pkgdir}/usr/share/nlpa2/nlpa2"
    install -Dm644 "${startdir}/LICENSES/MIT.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -rp "${srcdir}"/{data,lib} "${pkgdir}/usr/share/nlpa2/"
    magick mogrify \
           -resize "128x128" \
           -background none \
           -gravity center \
           -extent "128x128" \
           "${srcdir}/data/flutter_assets/assets/logo.png"
    install -Dm644 "${srcdir}/data/flutter_assets/assets/logo.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ee.nekoko.nlpa2.png"
    install -Dm644 "${srcdir}/data/flutter_assets/assets/logo-community.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ee.nekoko.nlpa2-community.png"
}
