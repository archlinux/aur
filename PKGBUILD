# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-accountsservice
pkgver=1.2.0
pkgrel=1
pkgdesc="Qt-style wrapper for Accounts Service"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('LGPL3')
depends=('qt5-declarative')
makedepends=('liri-qbs-shared')
groups=('liri')
source=("https://github.com/lirios/qtaccountsservice/releases/download/v${pkgver}/qtaccountsservice-${pkgver}.tar.xz")
sha256sums=('358a31f1b7db2f726a5146115843677254da3ede2c91db8788eac1cf6a5a88b5')

build() {
	cd qtaccountsservice-${pkgver}
	qbs setup-toolchains --type gcc /usr/bin/g++ gcc
	qbs setup-qt /usr/bin/qmake-qt5 qt5
	qbs config profiles.qt5.baseProfile gcc
	qbs build --no-install -d build profile:qt5 \
		modules.lirideployment.prefix:/usr \
		modules.lirideployment.qmlDir:/usr/lib/qt/qml
}

package() {
	cd qtaccountsservice-${pkgver}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}
