# Maintainer: Douglas Creager <dcreager at dcreager dot net>

pkgname=pi-coding-agent
pkgver=0.42.0
pkgrel=1
pkgdesc='A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks'
arch=('x86_64' 'aarch64')
url='https://shittycodingagent.ai/'
license=('MIT')
options=(!debug !strip)

source_x86_64=("pi-linux-$pkgver.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-x64.tar.gz")
sha256sums_x86_64=("7f775ab1de43f1d0cd226c9ca474d9917e51f60ba20507ec7b281bda38bab7ef")
source_aarch64=("pi-linux-$pkgver.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-arm64.tar.gz")
sha256sums_aarch64=("402101d9055dd05bac34f6a9d5b6bee45e4e26bf74819770698e750dacf6ebdb")
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
