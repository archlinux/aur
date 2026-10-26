# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-pipewire
pkgver=6.8.0
pkgrel=1
pkgdesc='Components relating to pipewire use in SonicDE'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-pipewire'
license=('LGPL-2.0-or-later')
depends=(
	'ffmpeg'
	'glibc'
	'libdrm'
	'libepoxy'
	'libgcc'
	'libpipewire'
	'libstdc++'
	'libva'
	'mesa'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-internationalization'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('kpipewire')
conflicts=('kpipewire')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d062fb8b84b25fba8e6f52a6d1876118bf8ac7961972fa037f038eddc27767dc')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
