# Maintainer: KirMozor <kirmozor96@gmail.com>
# Contributor: Archie <archie-woc@ya.ru>
# Contributor: Vasiliy Stelmachenok <ventureo@yandex.ru>
pkgname=yamux
pkgver=v57
pkgrel=1
pkgdesc="Yandex Music client"
arch=('x86_64')
url="https://gitlab.com/KirMozor/Yamux"
license=('GPL3')
depends=('gstreamer' 'dotnet-runtime>=6.0.0' 'gtk3')
makedepends=("dotnet-sdk>=6.0.0")
source=("git+https://gitlab.com/KirMozor/Yamux.git#tag=Yamux-$pkgver")
md5sums=(SKIP)

build() {
    cd Yamux
    dotnet build -c Release
}

package() {
    cd "${srcdir}/Yamux"
    
    # Copy desktop file and icon
    mkdir -p "$pkgdir/usr/share/applications"
    cp -r ./AUR/Yamux.desktop "$pkgdir/usr/share/applications"
    cp -r ./Svg/dark/icon.svg "$pkgdir/usr/share/pixmaps/yamux.svg"

    # Copy binaries
    mkdir -p "$pkgdir/opt"
    cp -r ./bin/Release/net6.0/linux-x64/. "$pkgdir/opt/Yamux"

    mkdir -p "$pkgdir/usr/bin"
    ln -sf /opt/Yamux/Yamux "$pkgdir"/usr/bin/yamux

    # License
    cp -r LICENSE "$pkgdir/opt/Yamux"
}
