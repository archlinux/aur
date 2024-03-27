# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>

pkgname=fwbuilder-git
pkgver=4853.8013c00e1
pkgrel=2
pkgdesc="Object-oriented GUI and set of compilers for various firewall platforms. Git version"
url="https://github.com/fwbuilder/fwbuilder"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=(
	'qt6-base'
	'hicolor-icon-theme'
	'libxml2'
	'libxslt'
	'net-snmp'
	'zlib'
)
makedepends=(
	'git'
	'cmake'
	'ninja'
)

source=("git+$url.git")
sha256sums=('SKIP')

build() {
	cd fwbuilder
	cmake -B build -GNinja -DUseQt6=1 -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd fwbuilder
	cmake --install build --prefix="$pkgdir/usr"
}

pkgver() {
	cd fwbuilder
	echo $(git rev-list --count master).$(git rev-parse --short master)
}
