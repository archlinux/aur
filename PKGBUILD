# Maintainer: Bennett Piater <bennett at piater dot name>

_watch="https://sourceforge.net/p/coras/activity/feed?source=project_activity"

pkgname='corastool'
pkgver='1.4'
pkgrel=1
pkgdesc="Editor for the family of CORAS security analysis diagrams."
arch=('x86_64') # Too lazy for i686
url="http://coras.sourceforge.net/coras_tool.html"
license=('unknown')

depends=('bash')
source=("$pkgname-$pkgver.zip::http://downloads.sourceforge.net/project/coras/CorasTool/corastool_v${pkgver}_non_windows.zip?r=http%3A%2F%2Fcoras.sourceforge.net%2Fdownloads.html&ts=1475586617&use_mirror=netix"
		"$pkgname.desktop"
)
sha512sums=('c8ae31e971996d68d6922ff928699bad6425d6920c9423ef446779aedb3f61b9f4a440ad70917bf70ef6270ec0b7883a7b6add1338456f71a536b6fbe2952206'
            'c6faeeb6fba3661407d3536c821d6b508ac8cc53168fbd14266b45f4a989da2030d6dced5c716ebc80a25e418d969599e478f06cd47988372808a80a8261fa01')

package() {
	cd "$srcdir/${pkgname}_v${pkgver}_non_windows"

	# Copy files to system
	mkdir -p "$pkgdir/usr/share/java/$pkgname/"
	cp -r linux.gtk.x86_64 repository "$pkgdir/usr/share/java/$pkgname/"

	mkdir -p "$pkgdir/usr/bin"
	chmod 755 "$pkgdir/usr/share/java/$pkgname/linux.gtk.x86_64/eclipse/eclipse"
	ln -sr "$pkgdir/usr/share/java/$pkgname/linux.gtk.x86_64/eclipse/eclipse" "$pkgdir/usr/bin/$pkgname"

	# Copy the licence
	#install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.txt

	# Copy the desktop file and image
	cd "$srcdir"
	install -Dm644 -t "$pkgdir/usr/share/applications/" *.desktop
	#install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
