# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gnumicr
pkgver=0.30
pkgrel=1
pkgdesc="An open-source licensed Type 1 MICR E13-B font"
arch=('any')
url="https://github.com/alerque/gnumicr"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
source=(https://github.com/alerque/gnumicr/archive/v0.30.tar.gz)
md5sums=('20e317196feb2ffea5a2a11c082eff52')

post_install() {
    echo -n "==> Rebuilding font cache... "
    fc-cache -f &> /dev/null
    mkfontscale /usr/share/fonts/TTF
    mkfontdir /usr/share/fonts/TTF
    echo "done"
}

post_upgrade() {
    post_install $1
}

post_remove() {
    post_install $1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -d ${pkgdir}/usr/share/fonts/TTF
    install -d ${pkgdir}/usr/share/fonts/Type1
    install -d ${pkgdir}/usr/share/fonts/OTF

    install -Dm644 GnuMICR.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -Dm644 GnuMICR.pfb "$pkgdir/usr/share/fonts/Type1/"
    install -Dm644 GnuMICR.pfm "$pkgdir/usr/share/fonts/Type1/"
    install -Dm644 GnuMICR.afm "$pkgdir/usr/share/fonts/Type1/"
    install -Dm644 GnuMICR.otf "$pkgdir/usr/share/fonts/OTF/"
}
