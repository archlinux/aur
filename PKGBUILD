# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=arcdps-log-manager
pkgver=1.8.0
_gitver=1.8.0
pkgrel=1
pkgdesc="Manager for Guild Wars 2 arcdps EVTC logs"
arch=(x86_64)
url="https://gw2scratch.com/tools/manager"
license=(MIT)
makedepends=(git 'dotnet-sdk-6.0' imagemagick)
depends=('dotnet-runtime-6.0' gtk3)
source=("git+https://github.com/gw2scratch/evtc.git#tag=manager-v$_gitver"
        "$pkgname.desktop")
sha256sums=('SKIP'
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
