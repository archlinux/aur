# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-qbs-shared
pkgver=1.2.0
pkgrel=1
pkgdesc="Extra imports and modules for Qbs"
arch=('any')
url='https://liri.io'
license=('BSD')
depends=('qbs')
groups=('liri')
source=("https://github.com/lirios/qbs-shared/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('1cbf3475bef23f3533bb164ad9eda7042d488a0e7a6a954b48cfb4c8cee1d1aa')

build() {
	cd ${pkgname}-${pkgver}
	qbs setup-toolchains --type gcc /usr/bin/g++ gcc
	qbs setup-qt /usr/bin/qmake-qt5 qt5
	qbs config profiles.qt5.baseProfile gcc
	qbs build --no-install -d build profile:qt5 project.prefix:/usr
}

package() {
	cd ${pkgname}-${pkgver}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5

	mkdir -p $pkgdir/usr/share/licenses/liri-qbs-shared
	cp LICENSE.BSD $pkgdir/usr/share/licenses/liri-qbs-shared
}
