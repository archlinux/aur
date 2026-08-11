# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>

pkgname=chain-lang
pkgver=0.5.1
pkgrel=2
pkgdesc="Chain programming language interpreter"
arch=('x86_64' 'aarch64')
url="https://github.com/Nebania/chain-lang"
license=('MIT')

depends=('gcc-libs' 'raylib')
makedepends=('gcc' 'make')

provides=('link-lang')
conflicts=('link-lang' 'link-lang-git' 'link-lang-bin' 'chain-lang-git' 'chain-lang-bin')

source=("https://github.com/Nebania/chain-lang/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/chain-lang-$pkgver"

  make
}

package() {
  cd "$srcdir/chain-lang-$pkgver"

  # Main executable
  install -Dm755 chainlang "$pkgdir/usr/bin/chainlang"

  # Command aliases
  ln -s chainlang "$pkgdir/usr/bin/chain"
  ln -s chainlang "$pkgdir/usr/bin/linklang"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
