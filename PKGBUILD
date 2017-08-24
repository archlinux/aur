# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Maintainer: hexchain <i at hexchain dot org>

pkgname=jetbrains-toolbox-extracted
_pkgname=jetbrains-toolbox
pkgver=1.4.2492
pkgrel=1
pkgdesc='Manage all your JetBrains Projects and Tools (extracted from AppImage)'
arch=('x86_64' 'i686')
url='http://www.jetbrains.com/toolbox/'
license=('custom')
makedepends=('libarchive' 'chrpath')
depends=('qt5-webengine' 'qt5-websockets')
source=(
    https://download.jetbrains.com/toolbox/$_pkgname-$pkgver.tar.gz
    jetbrains-toolbox.desktop)
sha512sums=('4c06642a9554fef89d326e6cd7ff80f50a317b00a5bdf63cb39e04009c8327295354aeacc5c395aeaefe001be3783a9888c444f83bb0fd95d1191f615209bcce'
            '904f0b9353197c16ba8bf7fca2d9356fb14f3ed199793f381816309f80977cab011c1631a3a944dcaf689232da91114f90d7cba24abe9585008375a1f68d89a3')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    bsdtar -xf jetbrains-toolbox

    cd usr/share/jetbrains-toolbox
    chrpath -d jetbrains-toolbox
}

package() {
    install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/toolbox.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
    install -Dm755 "$srcdir/$_pkgname-$pkgver/usr/share/jetbrains-toolbox/jetbrains-toolbox" -t "$pkgdir/usr/bin/"
}
