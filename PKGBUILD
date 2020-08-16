# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=stiki
pkgver=2018_12_08
pkgrel=1
pkgdesc="Wikipedia anti-vandalism tool"
arch=('x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:STiki"
license=('GPL')
depends=('java-runtime')
makedepends=('gendesk')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=(
    "http://www.andrew-g-west.com/docs/STiki_exec_$pkgver.zip"
    "stiki.sh"
    "$pkgname.svg::https://upload.wikimedia.org/wikipedia/commons/5/54/STiki_logo_without_background_image.svg"
)
sha256sums=('fa68c89ad68f14349427c813fa8ffe41f6564133c4b6307c9917ba1dd86cc69d'
            'b64353870fee3129922d12a7e1799d533e2acb1d6029e6f8a6bb04a003522321'
            '6b52a46af5f6f13a6ecf0cea0b3a1f45107db80cc11b961f6ea8612a7669e2c3')

prepare() {
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

package() {
    install -Dm644 "$srcdir/STiki_2018_12_10.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -Dm755 "$srcdir/stiki.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
