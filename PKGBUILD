# Maintainer: stiermid <mammadovthenull@gmail.com>
pkgname=kalm-git
_pkgname=${pkgname%-git}
pkgver=r299.56fb3a7
pkgrel=1
pkgdesc="Kalm can teach you different breathing techniques."
arch=('x86_64')
url="https://apps.kde.org/kalm/"
license=('LGPL-2.1-or-later')
depends=(
  'qt6-base'
  'kcoreaddons'
  'kconfig'
  'ki18n'
  'kirigami'
  'kirigami-addons'
  'kcrash'
  'qqc2-desktop-style'
)
makedepends=('git' 'make' 'gcc' 'cmake' 'extra-cmake-modules')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://invent.kde.org/utilities/kalm.git')
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname" || exit 1

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname" || exit 1
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd "${_pkgname}/build" || exit 1
	make DESTDIR="$pkgdir/" install
}
