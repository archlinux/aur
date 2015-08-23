pkgname=rover
pkgver=0.4.0
pkgrel=1
pkgdesc='Simple file browser for the terminal.'
arch=('i686' 'x86_64')
url='https://github.com/lecram/rover'
license=('custom:Public Domain')
depends=('ncurses')
source=("https://github.com/lecram/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f80c982cc7ebe873527f3725ec10a1288fecc8e5b5095d63415b6c261c10c2f4')

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
