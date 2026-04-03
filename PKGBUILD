# Maintainer: Douglas Creager <dcreager at dcreager dot net>

pkgname=pi-coding-agent
pkgver=0.65.0
pkgrel=1
pkgdesc='A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks'
arch=('x86_64' 'aarch64')
url='https://shittycodingagent.ai/'
license=('MIT')
options=(!debug !strip)

source_x86_64=("pi-linux-$pkgver.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-x64.tar.gz")
sha256sums_x86_64=("ad38c11fb6097c96eaf1e753fed7b79eb424711ff989071e773f9a8ab909e75b")
source_aarch64=("pi-linux-$pkgver.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-arm64.tar.gz")
sha256sums_aarch64=("594bd98c3a611872bc6da5ed4956e8904295c5a5e326e1803d62613030bbcc2a")
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
