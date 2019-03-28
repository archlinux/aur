pkgname=orbital-emu-git
pkgdesc='Experimental PlayStation 4 emulator. Git version.'
pkgver=0.0.145
pkgrel=1
epoch=0
arch=('x86_64')
license=('MIT')
url='https://phi.nz/orbital/'
depends=('sdl2' 'vulkan-icd-loader' 'pixman' 'dtc' 'libzip' 'haxm-altea-git')
makedepends=('git' 'python' 'vulkan-headers')
source=("orbital::git+https://github.com/AlexAltea/orbital.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/orbital"
	echo "0.0.$(git rev-list --count HEAD)"
}

prepare() {
	cd "${srcdir}/orbital"

	git submodule init
	git submodule update
}

build() (
	cd "${srcdir}/orbital"

	export ARFLAGS=rv
	export CFLAGS+=' -fPIC'

	./build.sh
)

package () {
	ldir="${pkgdir}/opt/orbital"
	install -dm 755 "${_ldir}"
	
	cd "${srcdir}/orbital"
	cp -r bin docs "$_ldir/"
	install -Dm 644 'README.md' "$ldir/README.md"
	install -Dm 644 'CREDITS.md' "$ldir/CREDITS.md"
	install -Dm 644 'LICENSE' "$ldir/LICENSE"
}

# vim:set ts=2 sw=2 et:
