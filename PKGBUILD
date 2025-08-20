# Maintainer: Kernel <kernelxdev@gmail.com>
pkgname=leash
pkgver=1.0
pkgrel=1
pkgdesc="A linux shell made in C# with .NET"
arch=('any')
url="https://github.com/Monkey-Fans-Studios/Leash"
license=('MIT')
depends=('dotnet-runtime-9.0')
makedepends=('dotnet-sdk-9.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Monkey-Fans-Studios/Leash/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e166002a05266f1a289656a3c6ef55f75d7bf8fd49aec5935c7c1a671d1f4a61')

prepare() {
    cd "$srcdir/Leash-$pkgver"
    dotnet restore
}

build() {
    cd "$srcdir/Leash-$pkgver"
    dotnet publish --configuration Release --output "$srcdir/publish"
}

package() {
    install -Dm755 "$srcdir/publish/LeashShell" "$pkgdir/usr/bin/leash"
}
