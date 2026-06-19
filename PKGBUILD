# Maintainer: Douglas Creager <dcreager at dcreager dot net>

pkgname=pi-coding-agent
pkgver=0.79.8
pkgrel=1
pkgdesc='A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks'
arch=('x86_64' 'aarch64')
url='https://pi.dev/'
license=('MIT')
options=(!debug !strip)

source_x86_64=("pi-linux-$pkgver.tar.gz::https://github.com/earendil-works/pi/releases/download/v$pkgver/pi-linux-x64.tar.gz")
sha256sums_x86_64=("738b87d366d4e43f62e6331a71392ee77a22e019dcdbcd23a7dacff856faee8f")
source_aarch64=("pi-linux-$pkgver.tar.gz::https://github.com/earendil-works/pi/releases/download/v$pkgver/pi-linux-arm64.tar.gz")
sha256sums_aarch64=("67ec6da357d3748ffafa5b7f65d8bfab79e36014b4a5b21a5478b8fbe5a8ad81")
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
