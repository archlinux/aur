pkgname=opentrace
pkgver=1.4.4.0
pkgrel=1
pkgdesc="A cross-platform GUI wrapper for NextTrace. Bringing you the familiar traceroute experience."
arch=('x86_64')
url="https://github.com/Archeb/opentrace"
license=('GPL3')
depends=('nexttrace' 'dotnet-runtime')
makedepends=('dotnet-sdk')
source=("https://github.com/Archeb/opentrace/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('600038d6510e6d2610cc88059491ec611d81e27e7065204b9032891c43595d31')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    dotnet build -c Release --use-current-runtime traceroute.sln
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/lib/opentrace
    mkdir -p $pkgdir/usr/bin
    cp -r ./bin/Gtk/Release/net*.*/linux-x64/* "$pkgdir/usr/lib/opentrace/"
    ln -sf /usr/lib/opentrace/OpenTrace "$pkgdir/usr/bin/opentrace"
    install -Dm644 "./opentrace.desktop" "${pkgdir}/usr/share/applications/OpenTrace.desktop"
    install -Dm644 "./icon.png" "$pkgdir/usr/share/pixmaps/opentrace.png"
}
