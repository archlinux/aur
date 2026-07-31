# Maintainer: username227 <gfrank227 at gmail dot com> 

pkgname=deemix-remastered
pkgver=2.4.3
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
b2sums=('960f36b92244d565f458ae5f10feca6d612ce4a364e84a153980fc5d66de024147ff76f3881845d10609087c57b1d41a181e702deb27099cf92152715f90677b'
        '8d1feabd59cb960c6cea4cd4f88010ba8eed7f452a8c7900d14c45039e70b28fa04808d053eb7e941d7529194815bdaca5509ba7cc92ed1cad32b9341ff0358a')
options=(!debug)
build() {
	cd $srcdir/deemix-remastered
	npm install
	npm run build
}

package(){
# Install Main Program
	install -dm755 $pkgdir/opt/deemix-remastered
	install -dm644 $pkgdir/usr/share/applications
	install -dm755 $pkgdir/usr/bin
	mv $srcdir/deemix-remastered/release/linux-unpacked/* $pkgdir/opt/deemix-remastered
# Install Shortcut to /usr/bin
	ln -s /opt/deemix-remastered/deemix-app $pkgdir/usr/bin/deemix-app
# Install desktop file and patch to correct program filename
	install -Dm755 $srcdir/deemix-app.desktop $pkgdir/usr/share/applications/deemix-app.desktop
# Install icon file
	install -Dm644 $srcdir/deemix-remastered/dist/icon.png $pkgdir/usr/share/icons/hicolor/1024x1024/apps/deemix-app.png
	
}

