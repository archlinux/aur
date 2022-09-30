# Maintainer: Gustavo Ramos Rehermann <rehermann6046@gmail.com>

pkgname=bspc-padman-git
_srcname=bspc
pkgver=1659723467.168.6417739
pkgrel=1
pkgdesc="Quake 3 BSP-to-AAS compiler, to create bot navigation meshes. WorldOfPadman version"
arch=("x86_64")
url="https://github.com/PadWorld-Entertainment/bspc"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'cmake' 'ninja')
optdepends=()
provides=("bspc" "bspc-padman")
conflicts=("bspc" "bspc-padman")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/PadWorld-Entertainment/bspc.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_srcname"

	# Use timestamp, because there are no tags or other sorts of version information,
	# to inform AUR helpers' update processes.
	printf "%s.%s.%s" "$(git show -s --format=%ct HEAD)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"
	
	cmake -B build -S "$_srcname" \
		-DCMAKE_BUILD_TYPE=None     \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev                    \
		-G Ninja
	
	cmake --build build
}
package() {
	# The below does not work, presumably because of the None target.
	#DESTDIR="$pkgdir/" cmake --install build
	
	# Also rename bspcwop to bspc.
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/build/bspcwop" "$pkgdir/usr/bin/bspc"
}
