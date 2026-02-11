# Maintainer: Ardox <ardox@axos-project.com>

_pkgname=fht-compositor-ipc-qml-plugin
pkgname="$_pkgname-git"
pkgver=r5.37c7cb1
pkgrel=1
pkgdesc="QML plugin to integrate fht-compositor with Quickshell."
arch=('x86_64')
url="https://github.com/nferhat/$_pkgname"
license=('GPL-3.0-or-later')
source=("git+${url}.git")
sha256sums=('SKIP')

makedepends=(
	'cmake'
	'pkgconf'
	'qt6-base'
	'qt6-declarative'
)
depends=(
	'qt6-base'
	'qt6-declarative'
)

optdepends=(
	'fht-compositor-git: A dynamic tiling Wayland compositor'
)

build() {
	cd "$srcdir/$_pkgname"

	cmake -B build -DCMAKE_BUILD_TYPE=Release
	cmake --build build -- -j"$(nproc)"
	# cmake --build build
}

package() {
	cd "$srcdir/$_pkgname"

	cmake --install build --prefix "$pkgdir/usr"
}
