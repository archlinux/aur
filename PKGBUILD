# Maintainer: Sean Anderson <seanga2@gmail.com>
_pkgname=postgresql-zson
pkgname=$_pkgname-git
pkgver=v1.1.r15.ga670585
pkgrel=1
pkgdesc="a PostgreSQL extension for transparent JSONB compression"
arch=(x86_64)
url="https://github.com/postgrespro/zson"
license=(MIT)
depends=("postgresql>=11")
makedepends=(git)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/postgrespro/zson.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd zson
	git describe --long --tags | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd zson
	make
}

package() {
	cd zson
	make DESTDIR="$pkgdir/" install
}
