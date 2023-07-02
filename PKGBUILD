_gitname=virtualmoonatlas
pkgname=virtualmoonatlas-git
pkgver=v8.2.1.g107c3ba4
pkgrel=1
pkgdesc="Software for Moon observation and survey"
arch=('x86_64')
url="https://www.ap-i.net/avl/en/start"
license=('GPL2')
makedepends=('lazarus' 'wget' 'cspice')
depends=('libpasastro')
provides=('virtualmoonatlas')
source=("virtualmoonatlas::git+https://github.com/pchev/virtualmoon.git")
md5sums=('SKIP')

pkgver() {
	cd ${_gitname}
	git describe --always | sed 's/-/./g'

}

build() {
	cd "$srcdir/${_gitname}"
	./configure fpc=/usr/lib/fpc/3.0.4/units/x86_64-linux/ lazarus=/usr/lib/lazarus prefix=$pkgdir/usr
	make
}

package() {
	cd "$srcdir/${_gitname}"
	make install
	./install_data.sh $pkgdir/usr
	chmod 755 $pkgdir/usr/share
}

