# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=sonic-crypto-library
pkgver=2.3.12
pkgrel=2
pkgdesc='SonicDE cryptographic library'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-crypto-library'
license=('LGPL-2.1-or-later')
depends=(
	'ca-certificates'
	'glibc'
	'libgcc'
	'libstdc++'
	'nss'
	'qt6-base'
)
makedepends=(
	'botan'
	'cmake'
	'doxygen'
	'libgcrypt'
	'libsasl'
	'openssl'
	'pkcs11-helper'
)
optdepends=(
	'botan: botan plugin'
	'libgcrypt: gcrypt plugin'
	'libsasl: SASL plugin'
	'openssl: SSL plugin'
	'pkcs11-helper: PKCS-11 plugin'
)
provides=('qca-qt6')
conflicts=('qca-qt6')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5259a57b7843e05a5a8c4658c6b28baf696c09c69fbd50b33292072bd985acff')

build() {
	cmake -B build -S $pkgbase-$pkgver \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TESTS=OFF \
		-DQCA_INSTALL_IN_QT_PREFIX=ON \
		-DQCA_MAN_INSTALL_DIR=/usr/share/man
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
