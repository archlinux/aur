# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=arcdps-log-manager
pkgver=1.12
_gitver=1.12
pkgrel=1
pkgdesc="Manager for Guild Wars 2 arcdps EVTC logs"
arch=(x86_64)
url="https://gw2scratch.com/tools/manager"
license=(MIT)
makedepends=(git 'dotnet-sdk-8.0' imagemagick)
depends=('dotnet-runtime-8.0' gtk3)
source=("git+https://github.com/gw2scratch/evtc.git#tag=manager-v$_gitver"
        "$pkgname.desktop")
sha256sums=('cfdaebedc0df2c80deff490fc48deab1dfd38a880b41fc6d010a2b89b18e1a7d'
            'ed093835a12ef648e9f19035faca91db0e18c89837e66f44e4e6e81980ac5bce')

build () {
    cd "$srcdir/evtc/ArcdpsLogManager.Gtk"
    dotnet build --configuration Release
    convert "$srcdir/evtc/ArcdpsLogManager/Images/program_icon.ico" \
        "$srcdir/icon.png"
}

package () {
    install -d "$pkgdir/opt/" "$pkgdir/usr/bin/"
    cp -Rl "$srcdir/evtc/ArcdpsLogManager.Gtk/bin/Release"/net*/ \
        "$pkgdir/opt/$pkgname"
    ln -s "/opt/$pkgname/GW2Scratch.ArcdpsLogManager.Gtk" \
        "$pkgdir/usr/bin/$pkgname"
    install -D "$srcdir/evtc/LICENSE" \
        "$pkgdir"/usr/share/licenses/arcdps-log-manager/LICENSE
    install -D "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -D "$srcdir/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
}
