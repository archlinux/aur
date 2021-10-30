# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=lunatic
pkgver=0.6.2
pkgrel=1
pkgdesc='Lunatic is an Erlang inspired runtime for WebAssembly'
arch=('x86_64')
url="https://github.com/lunatic-solutions/${pkgname}"
license=('MIT' 'APACHE')
depends=()
makedepends=('cargo')
source=("${url}/archive/v${pkgver}.tar.gz" "cd8db51732712c19a8114db290882d1bb6b928c0.diff")

build() {
  cd $pkgname-$pkgver
  patch -p1 < $srcdir/cd8db51732712c19a8114db290882d1bb6b928c0.diff
  cargo build --release
}

package() {
  install -Dm755 $pkgname-$pkgver/target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname-$pkgver/LICENSE-APACHE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE-APACHE
  install -Dm644 $pkgname-$pkgver/LICENSE-MIT "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE-MIT
}

sha256sums=('5d4802921a6e48c92d1de7b07a84a35f5206c6cc5594d0ee97e9a90b38fa487f'
            '7b5e85c6bf4d779004b7de1ab653d68eedd42bddd6656b21a1d92319f6e5bc22')
