# Maintainer: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: Marcel Mehlmann <marcel@mzumquadrat.de>

pkgname='ttdl'
pkgver=3.4.4
pkgrel=1
pkgdesc='TTDL - Terminal Todo List Manager. A CLI tool to manage todo lists in todo.txt format.'
url='https://github.com/VladimirMarkelov/ttdl'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install='ttdl.install'
b2sums=('d567229185f12213803eff3174d3836f91c9b7e3fd3fb4f1c2351a3746659fe5dddc45be4d38de48fa13e5fe074f865063a91f4f468e4d9cd8a5441a337bee16')

build() {
  cd "$srcdir/$pkgname-$pkgver"
	cargo build --release --color auto --target-dir target
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/ttdl "${pkgdir}/usr/bin/ttdl"
  install -Dm644 ttdl.toml "${pkgdir}/etc/ttdl.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
