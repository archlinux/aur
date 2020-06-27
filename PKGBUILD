# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

_font=yanone-kaffeesatz
pkgbase=$_font-font
pkgname=(otf-$_font{,-infinality} ttf-$_font{,-infinality})
pkgver=2.001
_sha=342dc8badffc187b2116099c5060e46c81eaf80d
pkgrel=1
pkgdesc='Reminiscent of 1920s coffee house typography, bridges the gap to present times'
url='https://www.yanone.de/fonts/kaffeesatz'
arch=('any')
license=('OFL')
makedepends=('git')
source=("git+https://github.com/alexeiva/$_font.git#tag=$sha"
        "45-$_font.conf"
        "90-non-tt-$_font.conf"
        "90-tt-$_font.conf")
sha256sums=('SKIP'
            '501ba2f942d261f39b2e41573407ece4214cbe99f44a34ee9235d4c98c079b21'
            '82cfa4d8d6ab06d97b3d2e39d5631154c153dd29bc747669d05e5039d217943f'
            '6b7bc5cd5c13770e073c1d49da13bd5df98a88916acb2dadbfb07aeb636c50c9')

package_otf-yanone-kaffeesatz() {
    provides=("$pkgbase")
    conflicts=("$pkgname-ibx<2")
    pkgdesc+=' (OTF)'
    cd "$_font"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt CONTRIBUTORS.txt
    install -Dm644 -t "$pkgdir/usr/share/docs/$pkgname/" AUTHORS.txt README.md
}

package_ttf-yanone-kaffeesatz() {
    provides=("$pkgbase")
    conflicts=("$pkgname-ibx<2")
    pkgdesc+=' (TTF)'
    cd "$_font"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/ttf/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt CONTRIBUTORS.txt
    install -Dm644 -t "$pkgdir/usr/share/docs/$pkgname/" AUTHORS.txt README.md
}

package_otf-yanone-kaffeesatz-infinality() {
    provides=("otf-$_font-ibx")
    replaces=("otf-$_font-ibx")
    confilts=("ttf-$_font-infinality")
    groups=('infinality-bundle-fonts-extra')
    pkgdesc+=' (OTF infinality configuration files)'
    depends=("${pkgname%-infinality}")
    install -Dm644 -t "$pkgdir/etc/fonts/conf.avail/" 45-yanone-kaffeesatz.conf 90-non-tt-yanone-kaffeesatz.conf
    install -dm755 "$pkgdir/etc/fonts/conf.d"
    cd "$pkgdir/etc/fonts/conf.d"
    ln -sf ../conf.avail/*.conf .
}

package_ttf-yanone-kaffeesatz-infinality() {
    provides=("ttf-$_font-ibx")
    replaces=("ttf-$_font-ibx")
    confilts=("otf-$_font-infinality")
    groups=('infinality-bundle-fonts-extra')
    pkgdesc+=' (TTF infinality configuration files)'
    depends=("${pkgname%-infinality}")
    install -Dm644 -t "$pkgdir/etc/fonts/conf.avail/" 45-yanone-kaffeesatz.conf 90-tt-yanone-kaffeesatz.conf
    install -dm755 "$pkgdir/etc/fonts/conf.d"
    cd "$pkgdir/etc/fonts/conf.d"
    ln -sf ../conf.avail/*.conf .
}
