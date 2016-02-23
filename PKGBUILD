# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=devtodo-git
pkgver=2.1.r23.g249609b
pkgrel=1
pkgdesc="A hierarchical command-line task manager."
arch=('i686' 'x86_64')
url="http://swapoff.org/devtodo.html"
license=('Apache')
makedepends=('git' 'go')
source=('git+https://github.com/alecthomas/devtodo2.git')
sha256sums=('SKIP')

pkgver() {
	cd devtodo2
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	GOPATH="$srcdir" go get gopkg.in/alecthomas/kingpin.v2
}

build() {
	cd devtodo2
	GOPATH="$srcdir" make
}

package() {
	cd devtodo2
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man"
	make PREFIX="$pkgdir/usr" install
}
