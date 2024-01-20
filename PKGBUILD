pkgname=rewards-theater-obs
_pkgname=RewardsTheater
pkgver=1.0.5
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
sha256sums=('0c606036c289b07334c87170736e94cda0b7ca121a4fd032888e0f3a010daa27')

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

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

