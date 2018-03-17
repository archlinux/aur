# Maintainer: James An <james@jamesan.ca>
# Contributor: David Pugnasse <david.pugnasse@gmail.com>

pkgname="pmd-bin"
_pkgname=${pkgname%-bin}
pkgver=6.1.0
pkgrel=1
pkgdesc="An extensible cross-language static code analyzer."
arch=('any')
url="http://pmd.github.io"
license=('BSD' 'Apache')
depends=('java-environment')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("https://github.com/$_pkgname/$_pkgname/releases/download/${_pkgname}_releases/$pkgver/$pkgname-$pkgver.zip"
        pmdapp)
md5sums=('566855f2010cfd6aa3a4957d00183197'
         '7026fc0d1d333c8c2728ed8d9ca4f453')

package() {
    cd "$_pkgname-bin-$pkgver"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    for app in pmd-bgastviewer pmd-cpd pmd-cpdgui pmd-designer pmd-designerold pmd; do
        install -Dm755 "../pmdapp" "$pkgdir/usr/bin/$app"
    done

    cd lib
    for file in *.jar; do
        install -Dm644 "$file" "$pkgdir/usr/share/java/$pkgname/$file"
    done
}
