# Maintainer: KirMozor <kirmozor@riseup.net>
# Contributor: Archie <archie-woc@ya.ru>
# Contributor: Vasiliy Stelmachenok <ventureo@yandex.ru>
_gitname=Yamux
pkgname=yamux
pkgver=v60
pkgrel=2
pkgdesc="Yandex Music client"
arch=('x86_64')
url="https://gitlab.com/KirMozor/Yamux"
license=('GPL3')
depends=('gstreamer' 'dotnet-runtime>=6.0.0' 'gtk3' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugin-pipewire')
makedepends=("dotnet-sdk>=6.0.0")
source=("https://gitlab.com/KirMozor/Yamux/-/archive/Yamux-v60/Yamux-Yamux-v60.tar.gz")
md5sums=('2df955ef696ad3d269372597a57a6515')

build() {
    cd "${srcdir}/$_gitname-$_gitname-$pkgver"
    dotnet publish -c release -r linux-x64 --self-contained
}

package() {
    cd "${srcdir}/$_gitname-$_gitname-$pkgver"
    
    # Copy desktop file and icons
    mkdir -p "$pkgdir/usr/share/yamux/svg"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/pixmaps"

    cp -r "./Yamux/AUR/Yamux.desktop" "$pkgdir/usr/share/applications"
    cp -r "./Yamux/Svg/icon.svg" "$pkgdir/usr/share/pixmaps/yamux.svg"
    cp -r "./Yamux/Svg/icon.svg" "$pkgdir/usr/share/yamux/svg/icon.svg"
    cp -r "./Yamux/Svg/about_icon.svg" "$pkgdir/usr/share/yamux/svg/about_icon.svg"
    cp -r "./Yamux/Svg/yandex_en_icon-icons.com_61632(1).png" "$pkgdir/usr/share/yamux/svg/yandex_en_icon-icons.com_61632(1).png"

    # Copy binaries
    mkdir -p "$pkgdir/opt"
    cp -r ./Yamux/bin/Release/net6.0/linux-x64/. "$pkgdir/opt/Yamux"

    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/Yamux/Yamux" "$pkgdir"/usr/bin/yamux

    # License
    cp -r ./LICENSE "$pkgdir/opt/Yamux"
}
