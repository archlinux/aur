# Maintainer: Benjamin Robin <dev@benjarobin.fr>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=otf-latin-modern-compat
pkgver=2.006
pkgrel=1
pkgdesc='Improved version of Computer Modern fonts as used in LaTeX (Compatibility version with old family names)'
arch=(any)
url='http://www.gust.org.pl/projects/e-foundry/latin-modern'
license=(LicenseRef-GFL)
conflicts=('otf-latin-modern')
provides=('otf-latin-modern')
source=("$url/download/lm${pkgver}otf.zip"
        "${url%/*}/licenses/GUST-FONT-LICENSE.txt"
        "update-fonts.py")
sha256sums=('608a6f3de9fbafd70f977fbf21ca32850178dd19b11530385358840c8f291f06'
            '5eb61bb836bb1845ef668717cb15b382e997748ce2629e4388cc5e4c3fa4e433'
            '1b9b18f141b10dacd7368762f03e38b11536af88eb723c27a8017df9c4801946')
makedepends=('python-fonttools')

package() {
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
    install -Dm0644 GUST-FONT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/GFL.txt"

    cd "$pkgdir/usr/share/fonts/OTF/"
    python "$srcdir/update-fonts.py"
}
