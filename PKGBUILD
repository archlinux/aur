# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>

pkgname="pkg2appimage"
pkgdesc="Tool and recipes to convert existing deb packages to AppImage. (Upstream CI)"
_pkgver=$(wget -q https://api.github.com/repos/AppImageCommunity/pkg2appimage/releases -O - | grep -iP '(?<=pkg2appimage-).*(?=-x86_64.AppImage)' -o | head -n 1)
pkgver=${_pkgver}
pkgrel=1
url="https://github.com/AppImageCommunity/pkg2appimage"
license=("GPL-2.0-only")
arch=("any")
provides=("$pkgname=$pkgver")
makedepends=(
    'wget'
    'grep'
)
pkg2appimage_url=$(wget -q https://api.github.com/repos/AppImageCommunity/pkg2appimage/releases -O - | grep 'pkg2appimage-.*-x86_64.AppImage' | grep browser_download_url | head -n 1 | cut -d '"' -f 4)
source=("$pkgname::$pkg2appimage_url")
noextract=("$pkgname.AppImage")

package() {
    cd "$srcdir"
    install -Dm755 $pkgname.AppImage $pkgdir/usr/share
}
