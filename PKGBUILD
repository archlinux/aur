# Maintainer: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Ivy Foster <code@escondida.tk>

pkgname=cgo-git
pkgver=0.r68.g0162380
pkgrel=2
pkgdesc='A terminal gopher client'
arch=(i686 x86_64)
url='https://github.com/kieselsteini/cgo'
license=(ISC)
depends=(glibc)
makedepends=(git)
provides=(cgo)
conflicts=(cgo)
source=('git+https://github.com/kieselsteini/cgo.git')
md5sums=(SKIP)

pkgver() {
	cd cgo
	printf '0.r%s.g%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
	cd cgo
	make PREFIX=/usr
}

package() {
	cd cgo
	make DESTDIR="$pkgdir" PREFIX=/usr install

	install -d "$pkgdir/usr/share/licenses/cgo-git"
	sed '/^ \*\//q' cgo.c > "$pkgdir/usr/share/licenses/cgo-git/LICENSE"
	install -Dm644 cgo.1 "$pkgdir/usr/share/man/man1/cgo.1"
	install -Dm644 cgorc "$pkgdir/usr/share/doc/cgo-git/cgorc"
}
