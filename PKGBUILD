# Maintainer: Douglas Creager <dcreager at dcreager dot net>

pkgname=pi-coding-agent
pkgver=0.52.9
pkgrel=1
pkgdesc='A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks'
arch=('x86_64' 'aarch64')
url='https://shittycodingagent.ai/'
license=('MIT')
options=(!debug !strip)

source_x86_64=("pi-linux-$pkgver.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-x64.tar.gz")
sha256sums_x86_64=("a13cc8aa472e2cd55bf101af0089b302318d0ae074399b73cfa352be1cc6c514")
source_aarch64=("pi-linux-$pkgver.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-arm64.tar.gz")
sha256sums_aarch64=("4bd761aca075ba6e44c1b8ca42a38513b23e19a5a8cac0d50e74d379f1ae59c7")
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
