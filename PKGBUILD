# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Bruce Zhang

_pkgname=SPIRV-Headers
pkgname=spirv-headers-git
pkgver=1.5.4.raytracing.fixed.r0.gf027d53
pkgrel=1
pkgdesc='SPIR-V header files Git version'
arch=('any')
url='https://www.khronos.org/registry/spir-v/'
license=('custom')
source=("git+https://github.com/KhronosGroup/$_pkgname.git")
sha1sums=('SKIP')
makedepends=('git' 'cmake')
conflicts=('spirv-headers')
provides=("spirv-headers=$pkgver")

pkgver() {
    cd "$_pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B build -S "$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
	install -Dm644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
