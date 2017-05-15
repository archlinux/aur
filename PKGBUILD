pkgname=rover
pkgver=1.0.0
pkgrel=1
pkgdesc='Simple file browser for the terminal.'
arch=('i686' 'x86_64')
url='https://github.com/lecram/rover'
license=('custom:Public Domain')
depends=('ncurses')
source=("https://github.com/lecram/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f2e6629107f80cc71e64cf1f2c79afe8c76d3aa0d53074bd221e5ddcda895a4e')

build() {
	cd "$pkgname-$pkgver"
	make
  sed -n '/All of the source code/,/warranty of any kind./p' README.md > LICENSE
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX='/usr' MANPREFIX='/usr/share/man' install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
