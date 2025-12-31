# Maintainer: Douglas Creager <dcreager at dcreager dot net>

pkgname=pi-coding-agent
pkgver=0.30.2
pkgrel=1
pkgdesc='A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks'
arch=('x86_64' 'aarch64')
url='https://shittycodingagent.ai/'
license=('MIT')
options=(!debug !strip)

source_x86_64=("pi-linux.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-x64.tar.gz")
b2sums_x86_64=("c3956a8b10aa70ef09a207119a10cf3a4b5618cc3a7452b56274e154a645994db46d8b92e217379b1c3bdda7ef0070b8a34c8bd46528c0853fc2a55f6bf4fb80")
source_aarch64=("pi-linux.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v$pkgver/pi-linux-arm64.tar.gz")
b2sums_aarch64=("6d4672af7869a8fb78610ff94b7eef0dc0e9fd648c1cac0437844e1f11921650b4e2a3d92d724dcbe5ce629e1bfc69a151519898cbce16f4b28f03142218385a")
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
