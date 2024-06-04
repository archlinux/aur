# Maintainer: Caleb Marshall <n0tAcyb0rg at proton dot me>
pkgname=kde-tasks-git
pkgver=r393.6371a6a
pkgrel=1
arch=(x86_64)
pkgdesc="Tasks is a to-do application, you can edit tasks on the fly and it saves all your work automatically."
url="https://invent.kde.org/utilities/toad"
license=('GPL-3.0-or-later')
depends=(kcoreaddons kirigami kconfig kirigami-addons qt6-declarative ki18n qt6-base gcc-libs glibc kwindowsystem kdbusaddons hicolor-icon-theme)
makedepends=(cmake extra-cmake-modules git ninja)
provides=(kde-tasks)
source=("$pkgname::git+https://invent.kde.org/utilities/toad.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd $pkgname
	cmake -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-G "Ninja"
	cmake --build build
}

package() {
	cd $pkgname
	DESTDIR="$pkgdir/" cmake --install build
}
