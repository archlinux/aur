pkgname=rover
pkgver=0.3.0
pkgrel=1
pkgdesc='Simple file browser for the terminal.'
arch=('i686' 'x86_64')
url='https://github.com/lecram/rover'
license=('custom:Public Domain')
depends=('ncurses')
source=("https://github.com/lecram/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4beb5b0e722c51cd47e0ec6c8591737251ec47f7882a53453a43e6924d673cb1')

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
