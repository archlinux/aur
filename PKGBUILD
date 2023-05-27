# Maintainer: éclairevoyant
# Contributor: aksr <aksr at t-com dot me>

_pkgname=hed
pkgname="$_pkgname-git"
pkgver=0.5.r512.g8a4eb03
pkgrel=1
epoch=
pkgdesc="Fast hexadecimal editor"
arch=('i686' 'x86_64')
url="https://repo.or.cz/w/$_pkgname.git"
license=(GPL2)
depends=(glibc ncurses)
makedepends=(git)
source=("git://repo.or.cz/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/hed.//'
}

build() {
	make -C $_pkgname
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm644 doc/README.dev "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
