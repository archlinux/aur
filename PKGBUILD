# Maintainer: Maxr1998 <aur@maxr1998.de>
_pkgname=finamp
pkgname=finamp-bin
pkgver=0.9.24_beta
pkgrel=1
pkgdesc="An open source Jellyfin music player"
arch=('x86_64' 'aarch64')
url="https://github.com/finamp-app/finamp"
license=('MPL-2.0')
depends=('gtk3' 'pango' 'libmpv.so')
provides=('finamp')
conflicts=('finamp')
source_x86_64=("$url/releases/download/${pkgver//_/-}/finamp-${pkgver//_/-}-linux-x64.tar.gz")
sha256sums_x86_64=('c170d2002b91432327eb7eca645c75c4ea7fa2881a71df5fd28683e925a55514')
sha256sums_aarch64=('c0ba0af064a5658cb47137d7e3906db6ed4371eb8e5225e7aafdb87c43aad167')
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
