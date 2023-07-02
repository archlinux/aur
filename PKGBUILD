pkgname=virtualmoonatlas-git
pkgver=8.2
pkgrel=1
pkgdesc="Software for Moon observation and survey"
arch=('x86_64')
url="https://www.ap-i.net/avl/en/start"
license=('GPLv2')
makedepends=('lazarus' 'wget' 'cspice')
depends=('libpasastro')
provides=('virtualmoonatlas')
source=("virtualmoonatlas::git+https://github.com/pchev/virtualmoon.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname}"
	./configure fpc=/usr/lib/fpc/3.0.4/units/x86_64-linux/ lazarus=/usr/lib/lazarus prefix=$pkgdir/usr
	make
}

package() {
	cd "$srcdir/${pkgname}"
	make install
	./install_data.sh $pkgdir/usr
	chmod 755 $pkgdir/usr/share
}

