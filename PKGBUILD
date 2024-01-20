pkgname=rewards-theater-obs-git
_pkgname=RewardsTheater
pkgver=1.0.5+5+g24c5a96
pkgrel=1
pkgdesc="An OBS plugin that lets your viewers redeem videos or sounds on stream via channel points."

arch=('x86_64')
url="https://github.com/gottagofaster236/RewardsTheater"
license=('GPL3')

depends=('obs-studio')

makedepends=(
	'ccache'
	'cmake'
	'extra-cmake-modules'
	'libx11'
	'boost'
	'qt6-base'
	'qt6-svg'
)

source=( 'git+https://github.com/gottagofaster236/RewardsTheater' )
sha256sums=('SKIP')

conflicts=('rewards-theater-obs')

pkgver() {
    cd "${srcdir}/${_pkgname%-git}"
    git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
	cd "${srcdir}/${_pkgname%-git}"
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DLINUX_PORTABLE=OFF
	cd build
	make
}

package() {
	cd "${srcdir}/${_pkgname%-git}/build"
	make DESTDIR="${pkgdir}/" install

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

