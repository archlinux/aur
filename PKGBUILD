# Maintainer: dautor
pkgname=tcl-profiling-git
pkgver=v1.2f435bf
pkgrel=1
pkgdesc="Tcl procedure profiler using Tracy"
arch=('x86_64')
url="https://github.com/dautor/tcl-profiling"
license=('BSD-2-Clause')
depends=('tcl' 'gcc-libs')
makedepends=('git' 'pkgconf')
optdepends=(
	'tk: profiling settings GUI'
	'tracy: GUI for viewing profiling capture'
)
source=(
	"tcl-profiling::git+https://github.com/dautor/tcl-profiling.git#branch=master"
    "tracy::git+https://github.com/wolfpld/tracy.git#tag=v0.15.0"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/tcl-profiling"
	printf 'v%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/tcl-profiling"
    TRACY_DIR="$srcdir/tracy" ./build.sh
}

package() {
	cd "$srcdir"
	install -Dm755 "tcl-profiling/profiling.so"  "$pkgdir/usr/lib/tcl8.6/profiling/profiling.so"
	install -Dm644 "tcl-profiling/profiling.tcl" "$pkgdir/usr/lib/tcl8.6/profiling/profiling.tcl"
	install -Dm644 "tcl-profiling/pkgIndex.tcl"  "$pkgdir/usr/lib/tcl8.6/profiling/pkgIndex.tcl"
	install -Dm644 "tcl-profiling/COPYRIGHT"     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "tracy/LICENSE"               "$pkgdir/usr/share/licenses/$pkgname/LICENSE-Tracy"
}
