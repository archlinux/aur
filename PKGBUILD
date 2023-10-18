# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=codevis-db-git
pkgver=r251.0008a7d
pkgrel=1
pkgdesc="an analysis and visualization tool designed to assist in code maintenance for C++ codebases"
arch=('x86_64')
url="https://invent.kde.org/sdk/codevis"
license=('Apache')
depends=('sqlite' 'qt5-base' 'lcov' 'clang' 'boost-libs' 'qt5-webengine' 'python' 'qt5-svg' 'llvm-libs' 'kparts5' 'knotifications5' 'kcrash5' 'kxmlgui5' 'ktexteditor5' 'karchive5' 'knewstuff5' 'kconfigwidgets5' 'kcoreaddons5' 'kcmutils5' 'kconfig5' 'ki18n5' 'kwidgetsaddons5' 'python-jinja-time' 'backward-cpp')
makedepends=('git' 'cmake' 'llvm' 'boost' 'extra-cmake-modules' 'kdoctools5' 'catch2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://invent.kde.org/sdk/codevis.git' 'git+https://github.com/tcanabrava/configuration-parser.git' 'git+https://github.com/tcanabrava/backward-cpp.git' 'git+https://github.com/tcanabrava/soci.git')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-db-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "${pkgname%-db-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
QT_QPA_PLATFORM='offscreen' ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
