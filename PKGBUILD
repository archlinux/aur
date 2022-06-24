# Maintainer: Young Fellow <youngfellow.le@gmail.com>
pkgname=walc
pkgver=0.2.2
pkgrel=2
pkgdesc="An unofficial WhatsApp Desktop client for linux systems."
arch=('any')
url="https://github.com/WAClient/WALC"
license=('GPL-3')
depends=('nodejs-lts-gallium' 'npm')
makedepends=('gendesk')
provides=('walc')
conflicts=('walc')
source=("WALC-$pkgver.tar.gz::https://github.com/WAClient/WALC/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('d922d89632fccb039119e2b654a4a87b')

prepare() {
	gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='WALC' --genericname='Unofficial WhatsApp Client for Linux' --custom='StartupWMClass=walc' --exec='npm start --prefix /opt/WALC' --icon='/opt/WALC/src/icons/logo360x360.png' --startupnotify='true' --categories='Network;Applications'

}

build() {
        cd "WALC-$pkgver"
        npm install
        npm run dev
}

package() {
        mkdir "$pkgdir/opt"
        mv "WALC-$pkgver" "$pkgdir/opt/WALC"

        install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
