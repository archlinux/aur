# Maintainer: Björn Feber <bfeber@protonmail.com>
pkgname=ross-applicationlauncher-git
pkgver=r34.e7bb771
pkgrel=1
pkgdesc="Application Launcher for the ROSS Shell"
arch=('x86_64')
url="https://github.com/rosssoftware/Shell/tree/master/ApplicationLauncher"
license=('GPL3')
depends=('libqtxdg')
optdepends=('qt5-x11extras' 'libx11')
makedepends=('cmake' 'qt5-tools' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/rosssoftware/Shell.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p "${pkgname%-git}/ApplicationLauncher/build"
}

build() {
	cd "${pkgname%-git}/ApplicationLauncher/build"
	cmake \
		.. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "${pkgname%-git}/ApplicationLauncher/build"
	make DESTDIR="$pkgdir/" install
}
