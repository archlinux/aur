# Maintainer: KirMozor <kirmozor96@gmail.com>
# Contributor: Archie <archie-woc@ya.ru>
# Contributor: Vasiliy Stelmachenok <ventureo@yandex.ru>
pkgname=yamux
pkgver=v59
pkgrel=2
pkgdesc="Yandex Music client"
arch=('x86_64')
url="https://gitlab.com/KirMozor/Yamux"
license=('GPL3')
depends=('gstreamer' 'dotnet-runtime>=6.0.0' 'gtk3')
makedepends=("dotnet-sdk>=6.0.0")
source=("https://gitlab.com/KirMozor/Yamux/-/archive/Yamux-v59/Yamux-Yamux-v59.1.tar.gz")
md5sums=(SKIP)

build() {
    cd Yamux-Yamux-v59.1
    dotnet build -c Release
}

package() {
	tar -czvf Yamux-Yamux-v59.1.tar .
	cd "${srcdir}/Yamux-Yamux-v59.1"
    
    # Copy desktop file and icon
    mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/pixmaps"
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
