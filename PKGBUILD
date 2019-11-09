# Maintainer: robertfoster

_gitname=tinyMediaManager
pkgname=tiny-media-manager-bin
pkgver=3.0.5
pkgrel=1
pkgdesc="A multi-OS media managment tool"
arch=('any')
url="http://www.tinymediamanager.org"
license=('Apache-2.0')
depends=('libmediainfo' 'java-runtime<=11')
noextract=("tmm_${pkgver}_linux.tar.gz")
source=("http://release.tinymediamanager.org/v3/dist/tmm_${pkgver}_linux.tar.gz"
	"tinyMediaManager.desktop"
)

package() {
	destpath="$pkgdir/usr/share/$_gitname"
	mkdir -p $destpath

	tar -xvf "tmm_${pkgver}_linux.tar.gz" -C $destpath

	chmod -R 777 "$pkgdir/usr/share/$_gitname"

	# Install desktop entry
	install -D "$srcdir/tinyMediaManager.desktop" "$pkgdir/usr/share/applications/tinyMediaManager.desktop"
	install -D $destpath/tmm.png $pkgdir/usr/share/pixmaps/tmm.png

	# Install launch scripts
	mkdir -p $pkgdir/usr/bin
	ln -sr /usr/share/tinyMediaManager/tinyMediaManagerCMD.sh "$pkgdir/usr/bin/tinymediamanager-cli"
	ln -sr /usr/share/tinyMediaManager/tinyMediaManager.sh "$pkgdir/usr/bin/tinymediamanager"
}

md5sums=('9d080ca788cf2f81cdbd52fecaf94e83'
'2a7ff77b909df626dd2062db14be8faa')
