# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=arcdps-log-manager
pkgver=1.0.2
pkgrel=1
pkgdesc="Manager for Guild Wars 2 arcdps EVTC logs"
arch=(x86_64)
url="https://gw2scratch.com/tools/manager"
license=(MIT)
makedepends=(git mono-msbuild)
depends=(dotnet-sdk gtk3)
source=("git+https://github.com/gw2scratch/evtc.git#tag=manager-v$pkgver")
sha256sums=(SKIP)

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
}
