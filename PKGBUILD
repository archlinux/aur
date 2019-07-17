# Maintainer: Tuxand <onemorelag@gmail.com>
pkgname=bittube-wallet-gui
pkgver=2.1.0.2
pkgrel=1
pkgdesc="Bittube wallet gui"
arch=(x86_64)
url="https://github.com/ipbc-dev/bittube-wallet-gui"
#Add license type.
#license=('')
makedepends=('git' 'cmake' 'boost')
depends=('openssl' 'boost-libs'  'libunwind' 'readline' 'unbound' 'hidapi'
		'qt5-base' 'qt5-declarative' 'qt5-graphicaleffects'
		'qt5-location' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-tools' 'qt5-webchannel'
		'qt5-webengine' 'qt5-x11extras' 'qt5-xmlpatterns' 'qt5-svg')
provides=("${pkgname}")
source=("git+${url}/#tag=${pkgver}")
md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname}"
	QT_SELECT=5 ./build.sh release
}

package() {
	cd "$srcdir/${pkgname%}/bittube/build/release/bin/"
	install -D -m755 "bittube-wallet-rpc" "$pkgdir/usr/bin/bittube-wallet-rpc"
	install -D -m755 "bittubed" "$pkgdir/usr/bin/bittubed"
}
