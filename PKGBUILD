pkgname=rover
pkgver=0.4.2
pkgrel=1
pkgdesc='Simple file browser for the terminal.'
arch=('i686' 'x86_64')
url='https://github.com/lecram/rover'
license=('custom:Public Domain')
depends=('ncurses')
source=("https://github.com/lecram/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2e3521487ccae06e38be40e182a0f1ddcbbe395474e47753fbdcae02d25f03a7')

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
