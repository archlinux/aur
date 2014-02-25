# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
pkgname=datacrow
pkgver=3.12.5
pkgrel=1
_pkgfile="${pkgname}_${pkgver//\./_}_zipped.zip"
pkgdesc='Movie, video, book, image, software, and music cataloger/media manager.'
arch=('any')
url='http://datacrow.net/'
license=('GPL3')
depends=('java-runtime')
changelog=ChangeLog
source=("https://downloads.sourceforge.net/${pkgname}/${_pkgfile}"
        'datacrow.sh'
        'datacrow.desktop')
md5sums=('b28bff2694f8f2886ffe7413f78772b9'
         '04322853e8f380f5d7a7b79a166226d8'
         '751bab7bc4aee2d5f5d667f3dba45ef4')

prepare() {
	cd "$pkgname"
	# Remove Windows files
	rm -rf *.exe *.cmd
	# Prepare executables
	chmod +x *.sh datacrow{32,64}bit
}

package() {
	cd "$pkgname"

	### Auxilliary files
	# Icons
	install -Dm644 'icons/datacrow.png'   "$pkgdir/usr/share/pixmaps/datacrow.png"
	install -Dm644 'icons/datacrow16.png' "$pkgdir/usr/share/pixmaps/datacrow-16.png"
	install -Dm644 'icons/datacrow32.png' "$pkgdir/usr/share/pixmaps/datacrow-32.png"
	# Launch script
	install -Dm755 '../datacrow.sh'      "$pkgdir/usr/bin/datacrow"
	install -Dm644 '../datacrow.desktop' "$pkgdir/usr/share/applications/datacrow.desktop"

	### Main package
	# Docs
	install -dm755 "$pkgdir/usr/share/doc"
	mv 'readme' "$pkgdir/usr/share/doc/$pkgname"
	# Main program files
	install -dm755 "$pkgdir/opt"
	cp -aR "../$pkgname" "$pkgdir/opt/"
}
