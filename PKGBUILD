# Maintainer: grtcdr <ba.tahaaziz@gmail.com>

pkgname=macchina
pkgver=5.0.3
pkgrel=1
pkgdesc="A system information fetcher, with an (unhealthy) emphasis on performance."

arch=('x86_64')
url="https://github.com/Macchina-CLI/macchina"
license=('MIT')

depends=('gcc-libs' 'glibc')
optdepends=('wmctrl: window manager support')
makedepends=('rust' 'cargo' 'libgit2' 'git')

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b235cc4830948dd9f90e4400cf008c4202b50f03400f7a44beb79dc093e5be93')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
   install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
   install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
