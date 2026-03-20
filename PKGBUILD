# Maintainer: Ali Mahmoud <aur.c3rt@gmail.com>
pkgname=snaptool
pkgver=1.1.0
pkgrel=1
pkgdesc="A minimal CLI system health snapshotter"
arch=('x86_64')
url="https://github.com/c3rt1fiedd/snaptool"
license=('GPL')
depends=('dotnet-runtime>=8.0')
makedepends=('dotnet-sdk>=8.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8bcb459c4a237fc59332be87dfe82bc849a92f9c573b049ae5d74d6598bb0db8')

build() {
cd "snaptool-$pkgver"
# We build a standard framework-dependent binary for maximum compatability
dotnet publish -c Release -o out -r linux-x64 --self-contained true -p:PublishSingleFile=true -p:PublishTrimmed=true
}

package() {
cd "snaptool-${pkgver}"

# Install the binary
install -Dm755 "out/Snaptool" "$pkgdir/usr/bin/snaptool"
install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
