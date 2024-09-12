pkgname=rewards-theater-obs
_pkgname=RewardsTheater
pkgver=1.0.8
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
sha256sums=('9a830b5cad78c8420880eb18624591060cd76cd231bee7b5953658641133d4d9')

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

