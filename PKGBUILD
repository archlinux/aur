# Maintainer: Popoolon <popolon at popolon.org>

pkgname=opentomb
_prjname=OpenTomb
pkgver=2018.02.04_alpha
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc="A Cross-Platform reimplementation of classic Tomb Raider 1—5 engines."
url="http://opentomb.github.io/"
license=('unknown')
arch=('x86_64' 'aarch64' 'riscv64')
makedepends=('cmake')
depends=('libpng' 'openal' 'zlib' 'sdl2')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://github.com/opentomb/${prjname}/archive/refs/tags/win32-${_pkgver}.tar.gz")
sha256sums=('a10fe30a4364fe4e7713c7bb0ce5e06589bf103900aabbb7fdc540aa44a245ea')

#pkgver() {
#	cd "$srcdir/$_prjname"
#	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare() {
	cd "$srcdir/"
	cmake -S ${_prjname}-win32-${_pkgver}  -B build  -DCMAKE_POLICY_VERSION_MINIMUM=3.5
}

build() {
	cd "$srcdir/"
	cmake --build build
}

package() {
#	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/opentomb"
	install -Dm755 "$srcdir/build/OpenTomb" "$pkgdir/usr/bin/opentomb"
	install -Dm644 "$srcdir/${_prjname}-win32-${_pkgver}/resource/icon/opentomb.ico" 

	mkdir -p "$pkgdir/usr/share/opentomb/"
	cp -a "$srcdir/${_prjname}-win32-${_pkgver}/shaders" "$pkgdir/usr/share/opentomb/shaders"
}
