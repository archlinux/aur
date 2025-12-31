# Maintainer: stiermid <mammadovthenull@gmail.com>
pkgname=fielding-git
_pkgname=${pkgname%-git}
pkgver=r298.28d7873
pkgrel=1
pkgdesc="A simple REST API testing tool"
arch=('x86_64')
url="https://apps.kde.org/fielding/"
license=('GPL v2')
depends=(
	'qt6-base'
	'extra-cmake-modules'
	'kcoreaddons'
	'kconfig'
	'ki18n'
	'kirigami'
	'kdbusaddons'
	'kirigami-addons'
)
makedepends=('git' 'make' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://invent.kde.org/utilities/fielding.git')
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname" || exit 1
	mkdir -p build
}

build() {
	cd "$_pkgname/build" || exit 1
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd "$_pkgname/build" || exit 1
	make DESTDIR="$pkgdir/" install
}
