pkgname=opentrace
pkgver=1.5.1
pkgrel=1
pkgdesc="A cross-platform GUI wrapper for NextTrace. Bringing you the familiar traceroute experience."
arch=('x86_64')
url="https://github.com/Archeb/opentrace"
license=('GPL3')
depends=('nexttrace' 'dotnet-runtime')
makedepends=('dotnet-sdk')
source=("https://github.com/Archeb/opentrace/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('296f98ed9f734e38c65ab7348d7098371a8fa3614c4f5b1db967b0c1d2982252')

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
    install -Dm644 "./Assets/Icons/icon.png" "$pkgdir/usr/share/pixmaps/opentrace.png"
}
