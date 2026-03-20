# Maintainer: Ali Mahmoud <aur.c3rt@gmail.com>
pkgname=snaptool
pkgver=1.0.0
pkgrel=2
pkgdesc="A minimal CLI system health snapshotter"
arch=('x86_64')
url="https://github.com/c3rt1fiedd/snaptool"
license=('GPL')
depends=('dotnet-runtime>=8.0')
makedepends=('dotnet-sdk>=8.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b191b209836bd585210eb7295271abf60f21000032502fdbe4246e4a4d33a434')

build() {
cd "snaptool-$pkgver"
# We build a standard framework-dependent binary for maximum compatability
dotnet publish -c Release -o out -r linux-x64 --self-contained true -p:PublishSingleFile=true -p:PublishTrimmed=true
}

package() {
cd "snaptool-${pkgver}"

# Install the binary
install -Dm755 "out/snaptool" "$pkgdir/usr/bin/snaptool"
install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
