# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-firewall
pkgver=6.8.0
pkgrel=1
pkgdesc='Control Panel for your system firewall'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-firewall'
license=(
	'GPL-2.0-or-later'
	'LGPL-2.0-or-later'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-auth'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
)
makedepends=(
	'python'
	'sonic-frameworks-cmake-modules'
)
optdepends=(
	'firewalld: firewalld backend'
	'iproute2: netstat backend'
	'python: ufw backend'
	'ufw: ufw backend'
)
provides=('plasma-firewall')
conflicts=('plasma-firewall')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cc302234efe5c7cb0c176ab3463377ca7932a8901c77a4233d794c3205f4d903')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
