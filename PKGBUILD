# Maintainer: HaCk0 <@HaCk0>
pkgname=walc
pkgver=0.3.3
pkgrel=2
pkgdesc="An unofficial WhatsApp Desktop client for linux systems."
arch=('x86_64')
url="https://github.com/WAClient/WALC"
license=('GPL3')
depends=('gtk3' 'alsa-lib' 'nss')
makedepends=('gendesk' 'nodejs-lts-iron' 'npm' )
provides=('walc')
conflicts=('walc')
options=(!strip)
source=("WALC-$pkgver.tar.gz::https://github.com/WAClient/WALC/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('2460b571b97b2158813067913b061648')

prepare() {
	gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='WALC' --genericname='Unofficial WhatsApp Client for Linux' --custom='StartupWMClass=walc' --exec='npm start --prefix /opt/WALC' --icon='/opt/WALC/src/icons/logo360x360.png' --startupnotify='true' --categories='Network;Applications' -n
}

build() {
        cd "WALC-$pkgver"
        npm install
        npm run production
}

package() {
        mkdir "$pkgdir/opt"
        mv "WALC-$pkgver" "$pkgdir/opt/WALC"
        install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
