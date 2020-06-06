# Maintainer: Jeffrey Crochet <jlcrochet at pm dot me>
# PKGBUILD based on dina-font-otb by Ckat

pkgname=gohufont-otb
pkgver=2.1
pkgrel=1
pkgdesc="OpenType bitmap conversion of Gohufont"
arch=(any)
url=https://font.gohu.org
license=(custom:WTFPL)
makedepends=(fonttosfnt)
conflicts=(gohufont gohu-ttf gohufont-powerline)
source=(https://font.gohu.org/gohufont-$pkgver.tar.gz)
md5sums=(154921c092ac5a4e1806e04d84d6707d)

_ex_pt() {
    _pt=${1%.pcf.gz}
    _pt=${_pt#*-}
    echo $_pt
}

build() {
    cd "$srcdir/gohufont-$pkgver"
    for f in *.pcf.gz; do
        fonttosfnt -o "${f/pcf.gz/otb}" "$f"
    done
}

package() {
    cd "$srcdir/gohufont-$pkgver"
    for i in *.otb; do
        install -Dm 644 $i "$pkgdir/usr/share/fonts/misc/$i"
    done
    install -Dm644 COPYING-LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING-LICENSE"
}
