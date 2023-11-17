pkgname=opentrace
pkgver=1.4.0.0
pkgrel=1
pkgdesc="A cross-platform GUI wrapper for NextTrace. Bringing you the familiar traceroute experience."
arch=('x86_64')
url="https://github.com/Archeb/opentrace"
license=('GPL3')
depends=('nexttrace' 'dotnet-runtime')
makedepends=('dotnet-sdk')
source=("https://github.com/Archeb/opentrace/archive/refs/tags/v1.4.0.0.tar.gz")
sha256sums=('5719d9ff2e891e6cdf81e0b9a333b9004fb2d7692fd6af334e9dde6bc78e980c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    dotnet build -c Release --use-current-runtime traceroute.sln
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/lib/opentrace
    mkdir -p $pkgdir/usr/bin
    cp -r ./bin/Gtk/Release/net6.0/linux-x64/* "$pkgdir/usr/lib/opentrace/"
    ln -sf /usr/lib/opentrace/OpenTrace "$pkgdir/usr/bin/opentrace"
    install -Dm644 "./opentrace.desktop" "${pkgdir}/usr/share/applications/opentrace.desktop"
    install -Dm644 "./icon.png" "$pkgdir/usr/share/pixmaps/opentrace.png"
}