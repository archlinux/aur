# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=arcdps-log-manager
pkgver=1.0.2
pkgrel=2
pkgdesc="Manager for Guild Wars 2 arcdps EVTC logs"
arch=(x86_64)
url="https://gw2scratch.com/tools/manager"
license=(MIT)
makedepends=(git mono-msbuild)
depends=(dotnet-sdk gtk3)
source=("git+https://github.com/gw2scratch/evtc.git#tag=manager-v$pkgver"
        "$pkgname.desktop")
sha256sums=(SKIP
            ed093835a12ef648e9f19035faca91db0e18c89837e66f44e4e6e81980ac5bce)

build () {
    cd "$srcdir/evtc"
    msbuild -target:Restore,Build ArcdpsLogManager.Gtk -p:Configuration=Release
}

package () {
    install -d "$pkgdir/opt/" "$pkgdir/usr/bin/"
    cp -Rl "$srcdir/evtc/ArcdpsLogManager.Gtk/bin/Release"/*app*/ \
        "$pkgdir/opt/$pkgname"
    ln -s "/opt/$pkgname/GW2Scratch.ArcdpsLogManager.Gtk" \
        "$pkgdir/usr/bin/$pkgname"
    install -D "$srcdir/evtc/LICENSE" \
        "$pkgdir"/usr/share/licenses/arcdps-log-manager/LICENSE
    install -D "$srcdir/evtc/ArcdpsLogManager/Images/program_icon.png" \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -D "$srcdir/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
}
