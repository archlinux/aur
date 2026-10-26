# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-frameworks-io-fuse
pkgver=6.0.0
pkgrel=3
arch=('x86_64')
pkgdesc='FUSE interface for sonic-frameworks-io'
url='https://github.com/Sonic-DE/sonic-frameworks-io-fuse'
license=('GPL-3.0-or-later')
depends=(
	'fuse3'
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-io'
)
makedepends=('sonic-frameworks-cmake-modules')
((USE_SYSTEMD)) || optdepends=(
	'etmpfiles: honor the kio-fuse tmpfiles cleanup exclusion'
)
provides=('kio-fuse')
conflicts=('kio-fuse')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a6f414d9aec161f5071464dd46753b445c87b15653925362d5110a0c72f927a3')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DQT_MAJOR_VERSION=6 \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
