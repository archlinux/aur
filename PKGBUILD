# Maintainer: Tyler Dence <tyzoid@archlinux32.org>

pkgname=nextcloud-desktop-git
pkgver=3.0.1
pkgrel=1
pkgdesc='Nextcloud desktop client'
arch=('i686' 'x86_64')
url='https://nextcloud.com/'
license=('GPL2')
makedepends=('cmake' 'qt5-tools' 'git')
depends=('qtkeychain' 'qt5-webkit' 'hicolor-icon-theme' 'xdg-utils' 'qt5-webengine' 'qt5-svg')
optdepends=(
  'python-nautilus: integration with Nautilus'
  'nemo-python: integration with Nemo'
)
conflicts=('mirall-git' 'owncloud-client' 'owncloud-client-ngs' 'owncloud-client-git' 'nextcloud-client' 'nextcloud-client-git' 'nextcloud-desktop')
provides=('nextcloud-client')
source=("https://github.com/nextcloud/desktop/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/desktop-${pkgver}";

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DNO_SHIBBOLETH=1 \
		-DQTKEYCHAIN_LIBRARY=/usr/lib/libqt5keychain.so \
		-DQTKEYCHAIN_INCLUDE_DIR=/usr/include/qt5keychain/ \
		-DOPENSSL_INCLUDE_DIR=/usr/include/openssl \
		-DOPENSSL_LIBRARIES=/usr/lib/ \
		-DCMAKE_INSTALL_SYSCONFDIR=/etc/${pkgname} \
		-DWITH_DOC=FALSE \
		.;

	make;
}

package() {
	cd "${srcdir}/desktop-${pkgver}";
	make DESTDIR="${pkgdir}" install
}
