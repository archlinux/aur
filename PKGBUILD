# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=sonic-oxygen-icons
pkgname=(
	'sonic-oxygen-icons'
	'sonic-oxygen-icons-svg'
)
pkgver=6.31.0
pkgrel=1
pkgdesc='SonicDE Oxygen Icon Theme'
arch=('any')
url='https://github.com/Sonic-DE/sonic-oxygen-icons'
license=('LGPL-2.1-or-later')
makedepends=(
	'qt6-base'
	'sonic-frameworks-cmake-modules'
)
provides=('oxygen-icons')
conflicts=('oxygen-icons')
options=('!debug')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ae899a9f2dc5e57db733ffcb662522ec432a3d31490f6f9362ae34dd00a32c1d')

build() {
	cmake -B build -S "$pkgname-$pkgver"
	cmake --build build
}

package_sonic-oxygen-icons() {
	DESTDIR="$pkgdir" cmake --install build
}

package_sonic-oxygen-icons-svg() {
	pkgdesc='SonicDE Oxygen Icon Theme (Scalable Vector Graphics)'

	cd "$pkgbase-$pkgver"
	find scalable -type f ! -name '*.sh' -exec \
		install -D -m644 "{}" "$pkgdir"/usr/share/icons/oxygen/{} \;
}
