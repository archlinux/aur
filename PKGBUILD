# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
pkgname=datacrow
pkgver=4.2.0
pkgrel=1
_pkgfile="${pkgname}_${pkgver//\./_}_client_zipped.zip"
pkgdesc='Movie, video, book, image, software, and music cataloger/media manager.'
arch=('any')
url='http://datacrow.net/'
license=('GPL3')
depends=('java-runtime')
changelog=ChangeLog
source=("https://www.fosshub.com/Data-Crow.html/${_pkgfile}"
        'datacrow.sh'
        'datacrow.desktop')
md5sums=('661cb74f927e7c381ac5fefd16c823c9'
         '04322853e8f380f5d7a7b79a166226d8'
         '751bab7bc4aee2d5f5d667f3dba45ef4')

prepare() {
	cd 'dc-client'
	# Remove Windows files
	rm -rf *.exe *.cmd
	# Prepare executables
	chmod +x datacrow{32,64}bit
}

package() {
	cd 'dc-client'

	### Auxilliary files
	# Icons
	install -Dm644 'icons/datacrow.ico'   "$pkgdir/usr/share/pixmaps/datacrow.ico"
	install -Dm644 'icons/datacrow.png'   "$pkgdir/usr/share/pixmaps/datacrow.png"
	install -Dm644 'icons/datacrow16.png' "$pkgdir/usr/share/pixmaps/datacrow-16.png"
	install -Dm644 'icons/datacrow32.png' "$pkgdir/usr/share/pixmaps/datacrow-32.png"
	install -Dm644 'icons/datacrow64.png' "$pkgdir/usr/share/pixmaps/datacrow-64.png"
	# Launch script
	install -Dm755 '../datacrow.sh'      "$pkgdir/usr/bin/datacrow"
	install -Dm644 '../datacrow.desktop' "$pkgdir/usr/share/applications/datacrow.desktop"

	### Main package
	# Docs
	install -dm755 "$pkgdir/usr/share/doc"
	mv 'readme' "$pkgdir/usr/share/doc/$pkgname"
	# Main program files
	install -dm755 "$pkgdir/opt"
	cp -aR "../dc-client" "$pkgdir/opt/$pkgname"
}
