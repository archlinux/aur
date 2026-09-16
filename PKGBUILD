# Maintainer: Błażej Dymek <dymekblazej@outlook.com>

pkgname=timesheet-tray-net
pkgver=0.1.0
pkgrel=1
pkgdesc="Tray application for tracking working hours"
arch=("x86_64")
url="https://github.com/BlazekWasTaken/timesheet-tray-net"
license=('GPL-3.0-or-later')
depends=("dotnet-runtime")
makedepends=("git" "dotnet-sdk")

source=("$pkgname-$pkgver::git+https://github.com/BlazekWasTaken/timesheet-tray-net.git#tag=v$pkgver")
sha256sums=('89422a5d2bda2d337e7b074bc2fe6ce48959fec494a1e0cb953791f7ce3d3abb')

build() {
    cd "$pkgname-$pkgver"
    
    dotnet clean
    dotnet publish timesheet-tray-net/timesheet-tray-net.csproj -c Release -r linux-x64 -p:SelfContained=false -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true -o out
}

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 out/timesheet-tray-net "$pkgdir/usr/bin/timesheet-tray-net"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 timesheet-tray-net.desktop "$pkgdir/usr/share/applications/timesheet-tray-net.desktop"
    install -Dm644 timesheet-tray-net.desktop "$pkgdir/etc/xdg/autostart/timesheet-tray-net.desktop"
}
