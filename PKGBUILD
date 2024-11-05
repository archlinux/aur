# Maintainer: Spas Dimitrov <spasnikod@gmail.com>
# Forked from: https://aur.archlinux.org/packages/brother-hl-1112

pkgname="brother-hl-1110"
pkgver="3.0.1_1"
pkgrel="3"
pkgdesc="Brother HL-1110 CUPS Driver"
url="https://support.brother.com/g/b/producttop.aspx?c=us_ot&lang=en&prod=hl1110_us_eu_as"
license=('GPL2')
arch=('x86_64')
depends=('cups' 'lprint')
optdepends=('cups-pdf: CUPS-PDF support')
conflicts=('brother-hl-1112')

sha256sums=(
    'be1dce6a4608cb253b0b382db30bf5885da46b010e8eb595b15c435e2487761c'
    '5af241782a0d500d7f47e06ea43d61127f4019b5b1c6e68b4c1cb4521a742c22'
)

source=(
    "https://download.brother.com/welcome/dlf100422/hl1110cupswrapper-GPL_src-3.0.1-1.tar.gz"
    "https://download.brother.com/welcome/dlf100419/hl1110lpr-3.0.1-1.i386.deb"
)

prepare() {
    cd "$srcdir/hl1110cupswrapper-GPL_src-3.0.1-1/brcupsconfig"
    sh ./mk

    cd "$srcdir"
    mkdir -p "$srcdir/data"
    tar -xzf data.tar.gz -C "$srcdir/data"
}

package() {
    install -Dm644 "$srcdir/hl1110cupswrapper-GPL_src-3.0.1-1/PPD/brother-HL1110-cups-en.ppd" "$pkgdir/usr/share/cups/model/brother-HL1110-cups-en.ppd"
    install -Dm755 "$srcdir/hl1110cupswrapper-GPL_src-3.0.1-1/filter/brother_lpdwrapper_HL1110" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HL1110"
    install -Dm755 "$srcdir/hl1110cupswrapper-GPL_src-3.0.1-1/brcupsconfig/brcupsconfig4" "$pkgdir/usr/bin/brcupsconfig4"
    install -Dm755 -d "$pkgdir/opt/brother/Printers/HL1110"

    #here is the patch related to https://bbs.archlinux.org/viewtopic.php?pid=1805109#p1805109
    cp -a "$srcdir/data/opt/brother/Printers/HL1110"/* "$pkgdir/opt/brother/Printers/HL1110/"
}


