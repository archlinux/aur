# Maintainer: grtcdr <ba.tahaaziz@gmail.com>

pkgname=macchina
pkgver=6.0.1
pkgrel=1
pkgdesc="A system information fetcher, with an (unhealthy) emphasis on performance."

arch=('x86_64')
url="https://github.com/Macchina-CLI/macchina"
license=('MIT')

depends=('gcc-libs' 'glibc')
optdepends=('wmctrl: window manager support')
makedepends=('rust' 'cargo' 'libgit2' 'git')

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9752386497b83ff9aed90ab7d762495a78fcef276d8ddca28d9781ce391d4cf2')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
   install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"

   install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm 644 "doc/man/${pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
   install -Dm 644 "doc/man/${pkgname}.7" -t "${pkgdir}/usr/share/man/man7"

   install -d "${pkgdir}/usr/share/${pkgname}/themes"
   install -m 644 contrib/themes/* "${pkgdir}/usr/share/${pkgname}/themes"
}
