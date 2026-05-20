# Maintainer: Douglas Creager <dcreager at dcreager dot net>

pkgname=pi-coding-agent
pkgver=0.75.4
pkgrel=1
pkgdesc='A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks'
arch=('x86_64' 'aarch64')
url='https://pi.dev/'
license=('MIT')
options=(!debug !strip)

source_x86_64=("pi-linux-$pkgver.tar.gz::https://github.com/earendil-works/pi/releases/download/v$pkgver/pi-linux-x64.tar.gz")
sha256sums_x86_64=("ebd9c2e5cae82779a2de9e7f34c7be6e453ef4b0b626340d02dacb09f29f7639")
source_aarch64=("pi-linux-$pkgver.tar.gz::https://github.com/earendil-works/pi/releases/download/v$pkgver/pi-linux-arm64.tar.gz")
sha256sums_aarch64=("725d3a654f9e0822fc5372e27ce817b229784c3c96eeaec05de9caaa2bf9ff4b")
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
