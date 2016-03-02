pkgname=rover
pkgver=0.4.1
pkgrel=1
pkgdesc='Simple file browser for the terminal.'
arch=('i686' 'x86_64')
url='https://github.com/lecram/rover'
license=('custom:Public Domain')
depends=('ncurses')
source=("https://github.com/lecram/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4437321d37f3e552e8abd19ad3d391a4e08472b584179b45d3d1a3a5c24db57b')

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
