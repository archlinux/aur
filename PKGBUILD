# Maintainer: tembleking <tembleking at gmail dot com>
pkgname=portainer-desktop
pkgver=1.0
pkgrel=1
pkgdesc="Portainer wrapper for localhost"
arch=('i686' 'x86_64')
url="https://portainer.io"
license=('unknown')
makedepends=('nodejs')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
provides=('portainer-desktop')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
source=('package.json'
		'package-lock.json'
		'portainer-desktop.png'
        'portainer-desktop.desktop'
		'portainer-desktop.sh')

build() {
	cd $srcdir

	npm install
	npm start
}

package() {
	install -dm755 "$pkgdir/opt/portainer-desktop"
	install -dm755 "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	cp -R "$srcdir/portainer-linux-x64/." "$pkgdir/opt/portainer-desktop/"
	chmod 755 "$pkgdir/opt/portainer-desktop/resources/app"

	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm755 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

