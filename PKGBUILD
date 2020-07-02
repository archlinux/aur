# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='chromium-extension-https-everywhere'
pkgver=2020.5.20
pkgrel=1
pkgdesc="Plugin for chromium which ensures you are using https whenever it's possible"
license=('GPL2')
arch=('any')
url="https://www.eff.org/https-everywhere"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/https-everywhere-chrome-$pkgver.crx")
noextract=("$pkgname-$pkgver.crx")
b2sums=('f12885ce55ec08c0cac514a75c9d74efc448811b7b7b3539a439563a2c7dcba443a4278fbd4c158aea2a2dc45c3816f392299a167e622dc116a15c0caa5527a6')

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    
    install -dm755 "$pkgdir/usr/share/chromium/extensions/"

    echo '{'                                                        > "$pkgdir/usr/share/chromium/extensions/gcbommkclmclpchllfjekcdonpmejbdp.json"
    echo "\"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\"," >> "$pkgdir/usr/share/chromium/extensions/gcbommkclmclpchllfjekcdonpmejbdp.json"
    echo "\"external_version\": \"$pkgver\""                       >> "$pkgdir/usr/share/chromium/extensions/gcbommkclmclpchllfjekcdonpmejbdp.json"
    echo '}'                                                       >> "$pkgdir/usr/share/chromium/extensions/gcbommkclmclpchllfjekcdonpmejbdp.json"
}
