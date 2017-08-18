# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-accountsservice
pkgver=1.1.0
pkgrel=1
pkgdesc="Qt-style wrapper for Accounts Service"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('LGPL3')
depends=('qt5-declarative')
makedepends=('qbs')
groups=('liri')
source=("https://github.com/lirios/qtaccountsservice/releases/download/v${pkgver}/qtaccountsservice-${pkgver}.tar.xz")
sha256sums=('8c4d74687751aa65c060761e0fc2109a90ae3af2ab7561b633b3defe48201544')

build() {
	cd qtaccountsservice-${pkgver}
	qbs setup-toolchains --type gcc /usr/bin/g++ gcc
	qbs setup-qt /usr/bin/qmake-qt5 qt5
	qbs config profiles.qt5.baseProfile gcc
	qbs build --no-install -d build profile:qt5 qbs.installRoot:/ qbs.installPrefix:usr modules.lirideployment.qmlDir:lib/qt/qml
}

package() {
	cd qtaccountsservice-${pkgver}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}
