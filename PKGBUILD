pkgname=opentrace
pkgver=1.4.2.1
pkgrel=1
pkgdesc="A cross-platform GUI wrapper for NextTrace. Bringing you the familiar traceroute experience."
arch=('x86_64')
url="https://github.com/Archeb/opentrace"
license=('GPL3')
depends=('nexttrace' 'dotnet-runtime')
makedepends=('dotnet-sdk')
source=("https://github.com/Archeb/opentrace/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e7f39b83cf7307f8279191fb9212602a0585439995c179494386e0560d4e6013')

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
    install -Dm644 "./opentrace.desktop" "${pkgdir}/usr/share/applications/opentrace.desktop"
    install -Dm644 "./icon.png" "$pkgdir/usr/share/pixmaps/opentrace.png"
}
