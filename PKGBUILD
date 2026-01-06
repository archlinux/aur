# Maintainer: Douglas Creager <dcreager at dcreager dot net>

pkgname=pi-coding-agent
pkgver=0.37.2
pkgrel=1
pkgdesc='A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks'
arch=('x86_64' 'aarch64')
url='https://shittycodingagent.ai/'
license=('MIT')
options=(!debug !strip)

source_x86_64=("pi-linux-$pkgver.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-x64.tar.gz")
sha256sums_x86_64=("e914e6be80c8f5a748e2c601cb8ab4f12dfcaebfda76d3d0d44fc83f8842807c")
source_aarch64=("pi-linux-$pkgver.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-arm64.tar.gz")
sha256sums_aarch64=("73344ecdae95ff0502ee83db3e1d568d17015745091ae205c56643de87e16b83")
noextract=("pi-linux-$pkgver.tar.gz")

makedepends=("tar")

package() {
    cd "$srcdir"
    install -d "$pkgdir/opt/pi-coding-agent"
    tar xCf "$pkgdir/opt/pi-coding-agent" "pi-linux-$pkgver.tar.gz"
    install -d "$pkgdir/usr/bin"
    ln -s ../../opt/pi-coding-agent/pi "$pkgdir/usr/bin/pi"

    cd "$pkgdir/opt/pi-coding-agent"
    install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
}
