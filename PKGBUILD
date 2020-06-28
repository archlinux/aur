# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname='battlescribe'
pkgver='2.03.21'
pkgrel=1
pkgdesc="An army list builder for table-top games."
arch=(any)
url="http://battlescribe.net/?tab=downloads"
_watch="$url"
license=('custom')

depends=()
source=("http://battlescribe.net/files/BattleScribe_$pkgver""_Linux.zip"
		"$pkgname.desktop"
		"$pkgname-data-editor.desktop"
		"$pkgname-data-indexer.desktop"
		"$pkgname.png"
		"$pkgname-roster-editor"
		"$pkgname-data-editor"
		"$pkgname-data-indexer"
		)
md5sums=('b97e14493028c282933333af4bb62cd7'
         '5e1ccb89db05b234416ba112bbd02372'
         '2b54d275f9be4e57b4e605f8871c38e6'
         '9af5e7e2a8444882061520d09af0af84'
         'd0fef06c5b080003f84a0e148fbe9261'
         '4187b4dcbcffd50db65d05ba59c8b414'
         'b9821873b19ba76c1405367a8c5136e3'
         '78c218e5c350cedc273f297ad2d712d9')

package() {
	cd "$srcdir"

	# Copy files to system
	install -D -t "$pkgdir/usr/share/java/$pkgname/" *.jar
        install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname-"{roster,data}-editor "$pkgname-data-indexer"
	mv lib jre "$pkgdir/usr/share/java/$pkgname/"

	# Copy the license
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.txt

	# Copy the desktop file and image
	install -Dm644 -t "$pkgdir/usr/share/applications/" *.desktop
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
