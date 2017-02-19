# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=bindinator-git
_pkgname=bindinator
pkgver=r176.d6176d0
pkgrel=1
pkgdesc="Generate a binding project for mono"
arch=(any)
url="https://github.com/shana/bindinator"
license=(MIT)
depends=(gobject-introspection gtk-sharp-3 libxslt)
makedepends=(git)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/shana/$_pkgname.git")
sha256sums=(SKIP)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname
	./autogen.sh --prefix=/usr
	make
}

check() {
	cd $_pkgname
	make -k check
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
