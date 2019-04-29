# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: David Pugnasse <david.pugnasse@gmail.com>
pkgname=pmd
pkgver=6.14.0
pkgrel=1
pkgdesc="An extensible cross-language static code analyzer."
arch=('any')
url="https://pmd.github.io/"
license=('BSD' 'Apache')
depends=('java-environment')
conflicts=("pmd-bin")
replaces=("pmd-bin")
source=("https://github.com/$pkgname/$pkgname/releases/download/${pkgname}_releases/$pkgver/$pkgname-bin-$pkgver.zip"
        pmdapp)
sha256sums=('6892d6b08ea680e51cb1a21efc6e0a55439c69a56f82e7a29c95b69575b8659f'
            'b1a73343ba0435801ce18c7fc18e14b7fed6a9be7b0a5907b67730471c176fc8')

package() {
    cd "$pkgname-bin-$pkgver"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    for app in pmd-bgastviewer pmd-cpd pmd-cpdgui pmd-designer pmd-designerold pmd; do
        install -Dm755 "../pmdapp" "$pkgdir/usr/bin/$app"
    done

    cd lib
    for file in *.jar; do
        install -Dm644 "$file" "$pkgdir/usr/share/java/$pkgname/$file"
    done
}
