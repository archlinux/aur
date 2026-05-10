pkgname=adobe-courier-otb-git
pkgver=r1.a343711
pkgrel=1
pkgdesc="Adobe Courier bitmap fonts repackaged as OpenType Bitmap (OTB) for GTK/Pango applications"
arch=('any')
url="https://github.com/osch/adobe-courier-otb"
license=('HPND' '0BSD')
depends=('fontconfig')
provides=('adobe-courier-otb')
conflicts=('adobe-courier-otb')
source=("$pkgname::git+https://github.com/osch/adobe-courier-otb.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    for variant in adobe-courier-otb adobe-courier-otb1 adobe-courier-otb2; do
        install -dm755 "$pkgdir/usr/share/fonts/$variant"
        install -m644 "$variant/fonts/"*.otb "$pkgdir/usr/share/fonts/$variant/"
    done

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
