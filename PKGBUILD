# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: schuay <jakob.gruber@gmail.com>

pkgname=sonic-ssh-password-prompt
pkgver=6.8.0
pkgrel=1
pkgdesc='ssh-add helper that uses the Sonic keyring and kpassworddialog'
url='https://github.com/Sonic-DE/sonic-ssh-password-prompt'
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qtkeychain-qt6'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-settings'
	'sonic-frameworks-widgets-addons'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=(
	'ksshaskpass'
	'x11-ssh-askpass'
)
conflicts=('ksshaskpass')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=('5b0ab24ae6a44f4d2622c1f77a873f0ecb0e2b9bb83d8a69df78ad227807c8c4')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
