# Maintainer: Douglas Creager <dcreager at dcreager dot net>

pkgname=pi-coding-agent
pkgver=0.36.0
pkgrel=1
pkgdesc='A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks'
arch=('x86_64' 'aarch64')
url='https://shittycodingagent.ai/'
license=('MIT')
options=(!debug !strip)

source_x86_64=("pi-linux.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-x64.tar.gz")
sha256sums_x86_64=("a79c8a844114658bf5f533095e4fd3602cfe4710fde863c606bcd7a411f22d8a")
source_aarch64=("pi-linux.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-arm64.tar.gz")
sha256sums_aarch64=("a81cd5c1313c94b716a5ff8603623d002194e5aea872bab5d2de1d8fd8c06adb")
noextract=("pi-linux.tar.gz")

makedepends=("tar")

package() {
    cd "$srcdir"
    install -d "$pkgdir/opt/pi-coding-agent"
    tar xCf "$pkgdir/opt/pi-coding-agent" pi-linux.tar.gz
    install -d "$pkgdir/usr/bin"
    ln -s ../../opt/pi-coding-agent/pi "$pkgdir/usr/bin/pi"

    cd "$pkgdir/opt/pi-coding-agent"
    install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
}
