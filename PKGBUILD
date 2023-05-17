# Maintainer: Young Fellow <youngfellow.le@gmail.com>
pkgname=walc
pkgver=0.3.0
pkgrel=2
pkgdesc="An unofficial WhatsApp Desktop client for linux systems."
arch=('x86_64')
url="https://github.com/WAClient/WALC"
license=('GPL3')
depends=('nodejs-lts-gallium' 'npm' 'gtk3' 'alsa-lib' 'nss')
makedepends=('gendesk')
provides=('walc')
conflicts=('walc')
source=("WALC-$pkgver.tar.gz::https://github.com/WAClient/WALC/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('4d3f8eb668ea2cfd9c551745c97194f7')

prepare() {
	gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='WALC' --genericname='Unofficial WhatsApp Client for Linux' --custom='StartupWMClass=walc' --exec='npm start --prefix /opt/WALC' --icon='/opt/WALC/src/icons/logo360x360.png' --startupnotify='true' --categories='Network;Applications' -n

}

build() {
        cd "WALC-$pkgver"
        npm install
        npm install whatsapp-web-electron.js # Reinstall to prevent build from failing
        npm run dist # Create a production build
}

package() {
        mkdir "$pkgdir/opt"
        mv "WALC-$pkgver" "$pkgdir/opt/WALC"

        install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
