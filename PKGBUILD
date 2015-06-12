#Maintainer: Ariel Popper <a at arielp dot com>

pkgname='express-git'
pkgver=0+263_d07544a
pkgrel=1
pkgdesc="EFL-based IRC Client which operates similar to the Terminology interface"
arch=('i686' 'x86_64')
url="https://git.enlightenment.org/devs/devilhorns/express.git/"
license=("custom")
makedepends=('git')
depends=('elementary')
source=("git+http://git.enlightenment.org/devs/devilhorns/express.git")
md5sums=('SKIP')

_gitname=express

pkgver () {
	cd "$srcdir/$_gitname"
	echo "0+$(git rev-list --count HEAD)_$(git describe --always )"
}

build() {
	cd "$srcdir/$_gitname"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install AUTHORS COPYING COPYING-PLAIN "$pkgdir/usr/share/licenses/$pkgname"
}
