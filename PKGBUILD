# Maintainer: Maxr1998 <aur@maxr1998.de>
_pkgname=finamp
pkgname=finamp-bin
pkgver=0.9.8_beta
pkgrel=1
pkgdesc="An open source Jellyfin music player"
arch=("x86_64")
url="https://github.com/jmshrv/finamp"
license=('MPL-2.0')
depends=('gtk3' 'pango')
provides=('finamp')
conflicts=('finamp')
source=("$url/releases/download/${pkgver//_/-}/finamp-${pkgver//_/-}-linux-release.tar.gz")
sha256sums=('3f344bf166ffeb8520a29364a89c0af15690e09cd369d9e408ed94148c13112d')

package() {
    cd "$srcdir"

    # Install release bundle
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -rdp --no-preserve=ownership "bundle/." "$pkgdir/opt/$_pkgname/"

    # Install desktop entry
    install -dm755 "$pkgdir/usr/share/applications/"
    m4 -D__INSTALL_PATH__="/opt/$_pkgname" "finamp.desktop.m4" > "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # Install icons
    install -dm755 "$pkgdir/usr/share/icons/hicolor"
    cp -rdp --no-preserve=ownership "icons/." "$pkgdir/usr/share/icons/hicolor"
}
