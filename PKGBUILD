# Maintainer: Young Fellow <youngfellow.le@gmail.com>
pkgname=walc
pkgver=0.2.2
pkgrel=1
pkgdesc="An unofficial WhatsApp Desktop client for linux systems."
arch=('any')
url="https://github.com/WAClient/WALC"
license=('GPL-3')
depends=('nodejs-lts-gallium' 'npm')
provides=('walc')
conflicts=('walc')
source=("WALC-$pkgver.tar.gz::https://github.com/WAClient/WALC/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('d922d89632fccb039119e2b654a4a87b')

package() {
	mkdir "$pkgdir/opt"
	mv "WALC-$pkgver" "$pkgdir/opt/WALC"
        cd "$pkgdir/opt/WALC"
	npm install
	npm run dev
	mkdir -p "$pkgdir/usr/share/applications"
	echo "[Desktop Entry]
Name=WALC
Type=Application
Comment=WhatsApp Linux Client
Exec=npm start --prefix /opt/WALC
Icon=/opt/WALC/src/icons/logo360x360.png
NoDisplay=false
StarupNotify=true" > "$pkgdir/usr/share/applications/walc.desktop"
	chmod +x "$pkgdir/usr/share/applications/walc.desktop"
}
