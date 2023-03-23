# Maintainer: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: Marcel Mehlmann <marcel@mzumquadrat.de>

pkgname='ttdl'
pkgver=3.7.0
pkgrel=1
pkgdesc='TTDL - Terminal Todo List Manager. A CLI tool to manage todo lists in todo.txt format.'
url='https://github.com/VladimirMarkelov/ttdl'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install='ttdl.install'
b2sums=('1d71675477363d3cc702e6d5f30467a6d8cbe3b52d78f3786715c588133b156da6a7d33cd0bfc6ad3f06bb010c305a240545e8a5fdb6ba1ca7e5ce663cc58084')

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
