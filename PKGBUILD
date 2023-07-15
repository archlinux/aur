# Maintainer: éclairevoyant
# Contributor: rr- <rr- at sakuya dot pl>

_pkgname=shot
pkgname="$_pkgname-git"
pkgver=2.1.r16.316b33d
pkgrel=2
pkgdesc='Minimal X11 screenshot tool aiming to provide good control over screenshot region'
arch=(x86_64)
url='https://github.com/rr-/shot'
license=(MIT)
depends=(libpng libxrandr)
makedepends=(cmake git)
source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	git -C $pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cmake -B build -S $pkgname \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_RELEASE_TYPE=Release
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
	install -Dm644 $pkgname/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
