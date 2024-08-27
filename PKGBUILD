# Maintainer: Entailz <entail-wraps0r at icloud dot com>

pkgname=quickshell
pkgver=r304.f95e7db
pkgrel=1
pkgdesc='Simple and flexbile QtQuick based desktop shell toolkit.'
arch=(x86_64 aarch64)
url='https://github.com/outfoxxed/quickshell'
license=('GPL')
depends=(
	'qt6-declarative'
	'qt6-base'
	'jemalloc'
	'qt6-svg'
	'libpipewire'
	'qt6-wayland'
	'wayland-protocols'
	'libxcb'
	'wayland'
	'cli11'
	'google-breakpad-git'
)
makedepends=(
	'ninja'
	'cmake'
	'pkgconf'
)

source=(
	"git+https://github.com/outfoxxed/quickshell.git"
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/quickshell"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
	QTWAYLANDSCANNER="/usr/lib/qt6/qtwaylandscanner" cmake -GNinja -B build \
		-DCMAKE_BUILD_TYPE="RelWithDebInfo"

	cmake --build build
}

package() {
	cd "${pkgname}"
	DESTDIR=$pkgdir cmake --install build
	install -Dm0644 -t "{$pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
