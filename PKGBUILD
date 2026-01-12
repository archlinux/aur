# Maintainer: Douglas Creager <dcreager at dcreager dot net>

pkgname=pi-coding-agent
pkgver=0.43.0
pkgrel=1
pkgdesc='A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks'
arch=('x86_64' 'aarch64')
url='https://shittycodingagent.ai/'
license=('MIT')
options=(!debug !strip)

source_x86_64=("pi-linux-$pkgver.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-x64.tar.gz")
sha256sums_x86_64=("a28d2513bd87f9998dbbf1dbb458541c704462956cdca138bfe6f62a66f35a76")
source_aarch64=("pi-linux-$pkgver.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-arm64.tar.gz")
sha256sums_aarch64=("7e3e4642d521677abf9ae81c5851379c784ab3fd9a013b7ca31959635ed7e2eb")
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
