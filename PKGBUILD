# Maintainer: Douglas Creager <dcreager at dcreager dot net>

pkgname=pi-coding-agent
pkgver=0.68.0
pkgrel=1
pkgdesc='A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks'
arch=('x86_64' 'aarch64')
url='https://shittycodingagent.ai/'
license=('MIT')
options=(!debug !strip)

source_x86_64=("pi-linux-$pkgver.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-x64.tar.gz")
sha256sums_x86_64=("1de540e77ba08d76aebd7b717409ea0116e6617604445b6e6ce86c0a70a72c29")
source_aarch64=("pi-linux-$pkgver.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-arm64.tar.gz")
sha256sums_aarch64=("44df59f1d608223d05535343ba7b415e936fc8fe6ee7c1d11965aa73ea3480e2")
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
