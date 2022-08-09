# Maintainer: Sakure <duarm0 at disroot dot org>
pkgname=cglm-git
_pkgname=cglm
pkgver=v0.8.5.r40.g7dfe67c
pkgrel=1
pkgdesc="Highly Optimized Graphics Math (glm) for C"
arch=('x86_64')
url="https://github.com/recp/cglm"
license=('MIT')
depends=('glibc')
conflicts=('cglm')
provides=('cglm')
source=("git+https://github.com/recp/cglm.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release
	cmake --build build --config release
}

package() {
	cd "$_pkgname"
	make -C build DESTDIR="$pkgdir/" install
	install -d "$pkgdir/usr/share/licenses/cglm/"
	install LICENSE "$pkgdir/usr/share/licenses/cglm/"
	install -d "$pkgdir/usr/lib/pkgconfig/"
	install build/cglm.pc "$pkgdir/usr/lib/pkgconfig/"
}
