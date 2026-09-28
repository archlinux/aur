# Maintainer: username227 <gfrank227 at gmail dot com> 

pkgname=deemix-remastered
pkgver=2.6.4
pkgrel=1
pkgdesc='Deemix Remastered is exactly what it sounds like: the classic downloader, remastered. Download music from deezer.'
url=https://github.com/DRAZY/deemix-remastered
license=(GPL-3.0-or-later)
arch=("x86_64")
provides=('deemix')
depends=('electron' 'hicolor-icon-theme')
makedepends=('git' 'npm' 'nodejs' 'libxcrypt-compat')
source=("git+$url#tag=v${pkgver}"
		"deemix-app.desktop")
b2sums=('ff3d3e3239b509340aadbbf0ed4abc6d552907d1f0a320bf9c57ec5118c429313d33fda5d4b27868d619c288cfd3137a652a23f1dcf76139c5d752e02d5520be'
        '974c2586ac5a59e6ace3d6313f013ddb3cd153553d35e3dd0efbb86005043c88aad23c7cb47b666185f71706357e455258fac1a89c6684c85af8b8f8821be6a4')
options=(!debug)
build() {
	cd $srcdir/deemix-remastered
	npm install
	npm run build
}

package(){
# Install Main Program
	install -dm755 $pkgdir/opt/deemix-remastered
	install -dm755 $pkgdir/usr/share/applications
	install -dm755 $pkgdir/usr/bin
	mv $srcdir/deemix-remastered/release/linux-unpacked/* $pkgdir/opt/deemix-remastered
# Install Shortcut to /usr/bin
	ln -s /opt/deemix-remastered/deemix-app $pkgdir/usr/bin/deemix-app
# Install desktop file and patch to correct program filename
	install -Dm755 $srcdir/deemix-app.desktop $pkgdir/usr/share/applications/deemix-app.desktop
# Install icon file
	install -Dm644 $srcdir/deemix-remastered/dist/icon.png $pkgdir/usr/share/icons/hicolor/1024x1024/apps/deemix-app.png
	
}


