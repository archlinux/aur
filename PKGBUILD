# Maintainer: username227 <gfrank227 at gmail dot com> 

pkgname=deemix-remastered
pkgver=2.5.4
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
b2sums=('26b2bc5f407a8d63c9b6d2376beae1fe68536c5960d7215a21110d357892a78580fefc8a404d934d22872fdc37d9628882a15a31f159cb0045492151d5c29301'
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


