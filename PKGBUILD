# Maintainer: Douglas Creager <dcreager at dcreager dot net>

pkgname=pi-coding-agent
pkgver=0.80.2
pkgrel=1
pkgdesc='A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks'
arch=('x86_64' 'aarch64')
url='https://pi.dev/'
license=('MIT')
options=(!debug !strip)

source_x86_64=("pi-linux-$pkgver.tar.gz::https://github.com/earendil-works/pi/releases/download/v$pkgver/pi-linux-x64.tar.gz")
sha256sums_x86_64=("2e68772bbeaacd73488751098193875389636b80589100609a29921ded71c984")
source_aarch64=("pi-linux-$pkgver.tar.gz::https://github.com/earendil-works/pi/releases/download/v$pkgver/pi-linux-arm64.tar.gz")
sha256sums_aarch64=("0719ecf50a42cae79f4c6f0d4a62e08e8d4421788ccd050d08a5bbf35c88edf6")
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
