# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-materialdecoration
pkgver=1.0.0
pkgrel=1
pkgdesc="Material Design decoration for Qt applications on Wayland"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('qt5-wayland')
makedepends=('liri-qbs-shared')
groups=('liri')
source=("https://github.com/lirios/materialdecoration/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('db5525bd7ddfdb36659e926f99f3703deeaf5eb2cd35ca6ea2ca4214fc161a33')

build() {
	cd ${pkgname}-${pkgver}
	qbs setup-toolchains --type gcc /usr/bin/g++ gcc
	qbs setup-qt /usr/bin/qmake-qt5 qt5
	qbs config profiles.qt5.baseProfile gcc
	qbs build --no-install -d build profile:qt5 \
		modules.lirideployment.prefix:/usr \
		modules.lirideployment.qmlDir:/usr/lib/qt/qml \
		modules.lirideployment.pluginsDir:/usr/lib/qt/plugins
}

package() {
	cd ${pkgname}-${pkgver}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}
