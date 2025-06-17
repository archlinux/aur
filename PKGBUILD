# Maintainer: Maxr1998 <aur@maxr1998.de>
_pkgname=finamp
pkgname=finamp-bin
pkgver=0.9.18_beta
pkgrel=2
pkgdesc="An open source Jellyfin music player"
arch=("x86_64")
url="https://github.com/jmshrv/finamp"
license=('MPL-2.0')
depends=('gtk3' 'pango' 'libmpv.so')
provides=('finamp')
conflicts=('finamp')
source=("$url/releases/download/${pkgver//_/-}/finamp-${pkgver//_/-}-linux-release.tar.gz")
sha256sums=('80401f1e32ba525ab9147dbdc9ef0f5dc7b5119166a32744b47639a7596cbf50')

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
