# Maintainer: Douglas Creager <dcreager at dcreager dot net>

pkgname=pi-coding-agent
pkgver=0.80.3
pkgrel=1
pkgdesc='A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks'
arch=('x86_64' 'aarch64')
url='https://pi.dev/'
license=('MIT')
options=(!debug !strip)

source_x86_64=("pi-linux-$pkgver.tar.gz::https://github.com/earendil-works/pi/releases/download/v$pkgver/pi-linux-x64.tar.gz")
sha256sums_x86_64=("e74a34ac2505556164144d8e39a64d6d5276f092166dad914319edc30c48abee")
source_aarch64=("pi-linux-$pkgver.tar.gz::https://github.com/earendil-works/pi/releases/download/v$pkgver/pi-linux-arm64.tar.gz")
sha256sums_aarch64=("c544ab2a0953a9bda358cab9bc328b1ef6892d4a824d8693880977e4b23c6168")
noextract=("pi-linux-$pkgver.tar.gz")

makedepends=("tar")

package() {
    mkdir -p "$srcdir/pi-linux-$pkgver"
    tar xCf "$srcdir/pi-linux-$pkgver" "pi-linux-$pkgver.tar.gz"
    install -d "$pkgdir/opt"
    cp -dr --no-preserve=ownership "$srcdir/pi-linux-$pkgver/pi" "$pkgdir/opt/pi-coding-agent"

    install -d "$pkgdir/usr/bin"
    ln -s ../../opt/pi-coding-agent/pi "$pkgdir/usr/bin/pi"

    cd "$pkgdir/opt/pi-coding-agent"
    install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
}
