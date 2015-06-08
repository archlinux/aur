# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=csfml-git
pkgver=2.3.r2.gee9b927
pkgrel=1
pkgdesc='Official binding of SFML for C. Git repository.'
arch=('i686' 'x86_64')
url='http://www.sfml-dev.org/'
license=('ZLIB')
depends=('sfml-git')
makedepends=('git' 'mesa' 'cmake' 'doxygen')
conflicts=('csfml')
provides=('csfml')
source=('csfml-git::git+https://github.com/SFML/CSFML.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"

	cmake -DCMAKE_INSTALL_PREFIX=/usr . -DBUILD_DOC=true
	make
	make doc
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
