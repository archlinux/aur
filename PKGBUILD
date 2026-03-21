# Maintainer: Ali Mahmoud <aur.c3rt@gmail.com>
pkgname=snaptool
pkgver=1.2.0
pkgrel=1
pkgdesc="A minimal CLI system health snapshotter"
arch=('x86_64')
url="https://github.com/c3rt1fiedd/snaptool"
license=('GPL')
depends=('dotnet-runtime>=8.0')
makedepends=('dotnet-sdk>=8.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8e6e1ebeb7f3e2c8b8b6ff578b0186e6d81f712bc2b2278db3ba1cab91a1b09e')

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
