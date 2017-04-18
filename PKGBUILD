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
sha256sums=('832d5e7c2e58bc9ad0e2d3e7f7803b275896891471c5e0bc112ff9d477d161ea'
            '53f6986ae3a68ca8f723248981847214b98677db2082f13fe84e766e6f59ef94'
            '129ded3d5cea72b783bba78e2ef18f95d1cc6eaf287b27761d7717be494c3b40')

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
