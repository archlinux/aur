# Maintainer: éclairevoyant

_pkgname=torch7-dok
pkgname="$_pkgname-git"
pkgver=r53.1b36900
pkgrel=1
pkgdesc='Documentation module for torch'
arch=('x86_64' 'i686')
url='https://github.com/torch/dok'
license=('custom')
depends=('torch7-git>=r819')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" install

	# Move pure Lua modules
	install -dm755 "$pkgdir/usr/share/lua/5.1/"
	mv "$pkgdir/dok" "$pkgdir/usr/share/lua/5.1/"

	install -Dm644 COPYRIGHT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
