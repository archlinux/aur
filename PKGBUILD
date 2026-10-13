# Maintainer: Maxr1998 <aur@maxr1998.de>
_pkgname=finamp
pkgname=finamp-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="An open source Jellyfin music player"
arch=('x86_64' 'aarch64')
url="https://github.com/finamp-app/finamp"
license=('MPL-2.0')
depends=('gtk3' 'pango' 'libmpv.so')
provides=('finamp')
conflicts=('finamp')
source_x86_64=("$url/releases/download/${pkgver//_/-}/finamp-${pkgver//_/-}-linux-x64.tar.gz")
sha256sums_x86_64=('0ba722bf2c67d45cc83c505f371f16c8637a1615d66035ebb08a9132ec6a92d0')
sha256sums_aarch64=('b29617cec8f170522b38dadfb1e49dba6a8c6dc99bde2fb86d4bfc0a88639d32')
source_aarch64=("$url/releases/download/${pkgver//_/-}/finamp-${pkgver//_/-}-linux-arm64.tar.gz")

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
