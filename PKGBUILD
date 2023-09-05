# Maintainer: Mr. Misconceptions <@MisconceivedSec>
pkgname=walc
pkgver=0.3.2
pkgrel=4
pkgdesc="An unofficial WhatsApp Desktop client for linux systems."
arch=('x86_64')
url="https://github.com/WAClient/WALC"
license=('GPL3')
depends=('nodejs-lts-gallium' 'npm' 'gtk3' 'alsa-lib' 'nss')
makedepends=('gendesk')
provides=('walc')
conflicts=('walc')
options=(!strip)
source=("WALC-$pkgver.tar.gz::https://github.com/WAClient/WALC/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('335557223abb59b64da5dbba09ec3ff5')

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
