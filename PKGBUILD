# Maintainer: Maxr1998 <aur@maxr1998.de>
_pkgname=finamp
pkgname=finamp-bin
pkgver=0.9.21_beta
pkgrel=1
pkgdesc="An open source Jellyfin music player"
arch=("x86_64")
url="https://github.com/jmshrv/finamp"
license=('MPL-2.0')
depends=('gtk3' 'pango' 'libmpv.so')
provides=('finamp')
conflicts=('finamp')
source=("$url/releases/download/${pkgver//_/-}/finamp-${pkgver//_/-}-linux-release.tar.gz")
sha256sums=('afe57aafbb50967a34c334f4eef20634e6df25303d305bb475174f742f0cffad')

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
