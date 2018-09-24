# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jacob Mischka <jacob@mischka.me>

pkgname=brave-bin
pkgver=0.24.0
pkgrel=2
pkgdesc='Web browser that blocks ads and trackers by default (binary release).'
arch=('x86_64')
url='https://www.brave.com'
license=('custom')
depends=('gtk3' 'gconf' 'nss' 'alsa-lib' 'libxss' 'libgnome-keyring' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support')
provides=("${pkgname%-bin}" 'brave-browser')
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver.tar.bz2::https://github.com/brave/browser-laptop/releases/download/v${pkgver}dev/brave.tar.bz2"
        'MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt'
        "$pkgname.sh"
        "$pkgname.desktop")
options=(!strip)
sha512sums=('6ff1dbbe3810a96a45738e77239fd4752fe7e949ef7cf5be74bf9a46f084db03be843497922e3932f2b1312089e5ad42394d95db243a034121318b063b9faeb0'
            'b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f'
            '9b027e4ff5fd8b718b3f3eb2b4a78deccd5f7cfd577943b9d4a2c63031231f3ca8f892fed8c1b4f9f35d148b9656501d0f054719b24d355adcca96bb4975d947'
            '400d345271a3c98be668e4aa08743d707647c92ee35951e937238ac07074119cfdb9601e1934cdf46014bd181b26ab0b568e4cab67c790efe53d029d8b0f9c55')

_bdir=brave-linux-x64

package() {
    install -d -m0755 "$pkgdir/usr/lib"
    cp -a --reflink=auto "$_bdir" "$pkgdir/usr/lib/$pkgname"

    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/brave"
    install -Dm0644 -t "$pkgdir/usr/share/applications" "$pkgname.desktop"
    install -Dm0644 "$_bdir/resources/extensions/brave/img/braveAbout.png" "$pkgdir/usr/share/pixmaps/brave.png"
    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "MPL2"
    mv "$pkgdir/usr/lib/$pkgname/"{LICENSE,LICENSES.chromium.html} "$pkgdir/usr/share/licenses/$pkgname"

    ln -s /usr/lib/PepperFlash "$pkgdir/usr/lib/pepperflashplugin-nonfree"
}
