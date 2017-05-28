# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-accountsservice
pkgver=1.0.0
pkgrel=1
pkgdesc="Qt-style wrapper for Accounts Service"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('LGPL3')
depends=('qt5-declarative')
makedepends=('qbs')
groups=('liri')
source=("https://github.com/lirios/qtaccountsservice/releases/download/v${pkgver}/qtaccountsservice-${pkgver}.tar.xz")
sha256sums=('ccfedf6f36cecfddb053e6cdf7ab4d79ab32e0d9831ae869c21a3f20e5f86ede')

build() {
	cd qtaccountsservice-${pkgver}
	qbs setup-toolchains --type gcc /usr/bin/g++ gcc
	qbs setup-qt /usr/bin/qmake-qt5 qt5
	qbs config profiles.qt5.baseProfile gcc
	qbs build --no-install -d build profile:qt5 qbs.installRoot:/ qbs.installPrefix:usr lirideployment.qmlDir:lib/qt/qml
}

package() {
	cd qtaccountsservice-${pkgver}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}
