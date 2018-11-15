# Maintainer:  Quint Guvernator <quint@guvernator.net>

pkgname=hp15c
pkgver=4.0.0
pkgrel=1
pkgdesc="A simulator for the HP-15C programmable scientific RPN calculator"
url="http://hp-15c.homepage.t-online.de/content_web.htm"
arch=('any')
license=('GPL3')
depends=('tcl' 'tk')
source=(
    "$pkgname-$pkgver.zip::https://drive.google.com/uc?export=download&id=1ewFXi6PPRsiPJESUq5A2Gp83NYSYVYKr"
    "01-hp15c-arch-docs.patch"
    "hp15c_runner.sh"
)
md5sums=('c90cc630d9e5bdf70912f8cd754cc2cc'
         'cb4a8e759f94860744057c20f90244e4'
         'bdf3ff02949e3c716b782e8cec9ee8a1')

prepare() {
    # patch location of help files to match Arch standards
    patch -p1 -i "$srcdir/01-hp15c-arch-docs.patch"
}

package() {

    # docs
    mkdir -p "$pkgdir/usr/share/doc/"
    cp -r doc "$pkgdir/usr/share/doc/$pkgname"
    cp "Read Me & Release Notes.html" "$pkgdir/usr/share/doc/$pkgname/README.html"

    # dependencies of script
    mkdir -p "$pkgdir/usr/lib/$pkgname/"
    cp -r css icons lib msgs -t "$pkgdir/usr/lib/$pkgname/"
    install -Dm644 HP-15C_Simulator_Font.ttf -t "$pkgdir/usr/share/fonts/"

    # runs script in proper directory
    cp HP-15C.tcl -t "$pkgdir/usr/lib/$pkgname/"
    install -D "$srcdir/hp15c_runner.sh" "$pkgdir/usr/bin/hp15c"
}

# vim:set ts=4 sw=4 ft=sh et:
