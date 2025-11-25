#Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgname=implot-git
pkgver=0.17.285df95
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
            '4199a19cb2c5c03a5fed3f97c21f71b7c6ec75a3e0db41db8cf12bfa832c03ec')

pkgver() {
	cd implot
	_cmt=$(git rev-parse --short HEAD)
	printf %s.%s 0.17 ${_cmt}
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
