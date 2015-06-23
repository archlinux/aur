# Maintainer: Oleg Plakhotniuk <olegus8@gmail.com>
pkgname=python2-diethack
pkgver=1.0.0
pkgrel=1
pkgdesc="Diet problem solver with Dietary Reference Intakes in mind."
arch=('any')
url="http://www.diethack.org"
license=('custom')
depends=('glpk' 'python2')
makedepends=('git' 'python2-setuptools' 'unzip')
source=("git+https://github.com/diethack/diethack#tag=${pkgver}"
        'https://www.ars.usda.gov/SP2UserFiles/Place/80400525/Data/SR27/dnload/sr27asc.zip')
md5sums=('SKIP'
         '74ed79e23e2eefc019bcebd34e9d4228')

package() {
    mkdir -p "$pkgdir"/usr/share/{,doc/,licenses/}"$pkgname"
    cp -r "$srcdir/diethack/src/examples" "$pkgdir/usr/share/$pkgname"
    cp "$srcdir/diethack/README.md" "$pkgdir/usr/share/doc/$pkgname"
    cp "$srcdir/diethack/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

    cd "$srcdir/diethack/src"
    unzip "$srcdir/sr27asc.zip" -d diethack/nndb
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
