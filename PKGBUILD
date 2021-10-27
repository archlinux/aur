# Maintainer: grtcdr <ba.tahaaziz@gmail.com>

pkgname=macchina
pkgver=4.0.1
pkgrel=1
pkgdesc="A system information fetcher, with an (unhealthy) emphasis on performance."

arch=('x86_64')
url="https://github.com/Macchina-CLI/macchina"
license=('MIT')

depends=('gcc-libs' 'glibc')
optdepends=('wmctrl: window manager support')
makedepends=('rust' 'cargo' 'git')

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6b2fc30a2ba8728f6608ec402b9c41f79f4c7753f40d505d4c93ec491671cdb4')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
   install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
   install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
