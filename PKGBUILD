pkgname=rewards-theater-obs
_pkgname=RewardsTheater
pkgver=1.0.7
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

source=( "$_pkgname-$pkgver.tar.gz::https://github.com/gottagofaster236/RewardsTheater/archive/refs/tags/$pkgver.tar.gz" )
sha256sums=('6d096dd0e8379ae35d7fed5c41148fc2cc7744652b3570f237e499dc63975437')

conflicts=('rewards-theater-obs-git')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DLINUX_PORTABLE=OFF
	cd build
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}/" install

	install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

