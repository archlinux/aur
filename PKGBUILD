# Maintainer: Ali Mahmoud <aur.c3rt@gmail.com>
pkgname=snaptool
pkgver=1.3.2
pkgrel=2
pkgdesc="A minimal CLI system health snapshotter"
arch=('x86_64')
url="https://github.com/c3rt1fiedd/snaptool"
license=('GPL')
depends=('dotnet-runtime>=8.0')
makedepends=('dotnet-sdk>=8.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a69414212fc842aa1a77d6e125718ce317bf0a3c623fd9115e44b9b4d0c48786')

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
