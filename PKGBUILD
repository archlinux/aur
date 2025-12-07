# Maintainer: Sultan <berkkapla82@proton.me>
pkgname=dcshowcase
pkgver=1.2.0
pkgrel=1
pkgdesc="A high-performance, cross-platform tool to analyze your Discord Data Package"
arch=('x86_64')
url="https://github.com/compiledkernel-idk/dc-showcase"
license=('GPL3')
depends=('zlib' 'openssl' 'icu')
makedepends=('dotnet-sdk' 'git')
provides=('dcshowcase')
conflicts=('dcshowcase')
source=("https://github.com/compiledkernel-idk/dc-showcase/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c1122b37d3f4c2cd370fc558f2b8d4a169d16eabc24f617b741b70d6ad751071')
options=('!strip')

build() {
  cd "$srcdir/dc-showcase-$pkgver/DiscordVoyagerCLI"
  dotnet restore
  dotnet publish -c Release -r linux-x64 --self-contained true -o "$srcdir/publish" \
    -p:PublishSingleFile=true \
    -p:PublishTrimmed=true \
    -p:StripSymbols=true
}

package() {
  install -Dm755 "$srcdir/publish/showcase" "$pkgdir/usr/bin/dcshowcase"
  install -Dm644 "$srcdir/dc-showcase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/dc-showcase-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}