# Maintainer: Fridrich Csoltko <crwxrws@protonmail.com>

pkgname=ofmcgui
_pkgcaps=OFMCGUI
pkgver=r7.efd86ae
pkgrel=2
pkgdesc="A graphical interface for the Open-Source Fixed-Point Model-Checker (OFMC)"
arch=('x86_64')
url="https://github.com/ulfur88/$_pkgcaps"
license=('BSD')
depends=('java-runtime>=12'
         'java-openjfx>=12'
         'ofmc>=2018')
source=("git+https://github.com/ulfur88/$_pkgcaps.git#commit=efd86ae"
        "BSD Licence.txt"
        "ofmcgui.sh")
md5sums=('SKIP'
         '1a9d9940302d5c93d73a724ed7f4ce87'
         '424d976c1a21b6bf18ce7d18aad5b1d7')

pkgver() {
    cd "$srcdir/$_pkgcaps"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"

    rscdir="$pkgdir/usr/share/java/$pkgname"
    mkdir -p "$rscdir/lib"
    for e in base controls fxml graphics; do
        ln -s "/usr/lib/jvm/default/lib/javafx.$e.jar" "$rscdir/lib/javafx.$e.jar"
    done

    install -Dm644 "$_pkgcaps/$_pkgcaps.jar" "$rscdir/$_pkgcaps.jar"
    install -Dm755 "ofmcgui.sh" "$pkgdir/usr/bin/ofmcgui"
    install -Dm644 "BSD Licence.txt"  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
