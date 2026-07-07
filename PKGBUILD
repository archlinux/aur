#Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgname=implot-git
pkgver=1.0.r722.gd65a2be
pkgrel=1
pkgdesc="Immediate Mode Plotting"
arch=('any')
url="https://github.com/epezent/implot"
license=('MIT')

provides=('implot')
depends=('imgui')
makedepends=('cmake')
source=("git+https://github.com/epezent/implot.git"
	'CMakeLists.txt'
)
sha256sums=('SKIP'
            'b08db392e9d99d1b78128b5a7cc13b47c80d99053915d0d795e3463b6668742c')

pkgver() {
	cd implot
	_rev=$(git rev-list --count HEAD)
	_cmt=$(git rev-parse --short HEAD)
	printf %s.r%s.g%s 1.0 ${_rev} ${_cmt}
}

prepare() {
	mv CMakeLists.txt implot/
}

build() {
	cd implot
	cmake .
	cmake --build .
}

package() {
	install -dm755 ${pkgdir}/usr
	cd implot
	cmake --install . --prefix ${pkgdir}/usr
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/implot/LICENSE
}
