# Maintainer: Nathan Chere <aur at nathanchere dot com dot au>
pkgname=forge-gui-desktop
pkgver=2.0.07
pkgrel=1
pkgdesc="The Magic: The Gathering Rules Engine (now with Shandalar-style adventure mode)"
arch=('any')
url="https://github.com/Card-Forge/forge"
license=('GPL3')
depends=('jre17-openjdk')
source=("https://github.com/Card-Forge/forge/releases/download/forge-$pkgver/forge-installer-$pkgver.tar.bz2"
	"https://github.com/Card-Forge/forge/raw/e16a80e822dd040cc6c768152f3493eb4f2ce09a/AppIcon.png"
	"forge-gui-desktop.desktop"
	"forge-adventure.desktop"
	"forge-adventure-editor.desktop"
	"forge-gui-desktop.sh"
	"forge-adventure.sh"
	"forge-adventure-editor.sh")
sha1sums=('b62deea295350829abad8da56e83a3e04fcce30f'
          '9a957969da65cf281ceb31a3737bb3b8b799f14b'
          '8d00372dd9e86f8bf311f9a2586ba31f0b73d9f7'
          'a9eb149708ec52bdbf3faa0c2ba4d3a7b60ca1da'
          '336f42396df98c62cde679dcc2c03a2bb8824cdc'
          'db1b6a33406ea96a7c265d9d29c8f68250e04244'
          '5f2212ea722047ad8c8a885a51d3a47d0946cd80'
          '78ce32fe1cef569925e5c7695efc73965f2bf4a0')

package() {
	cd "$srcdir"
	local extracted="$srcdir/forge-installer"
	rm -rf "$extracted"
	mkdir "$extracted"
	tar xf forge-installer-$pkgver.tar.bz2 -C "$extracted"
	install -d -m0755 "$pkgdir"/usr/share/$pkgname/res
	cp -r "$extracted"/res/* "$pkgdir"/usr/share/$pkgname/res
	install -Dm0664 "$extracted"/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm0644 "$srcdir"/AppIcon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

	install -Dm0644 "$extracted"/"forge-gui-desktop-$pkgver-jar-with-dependencies.jar" "$pkgdir"/usr/share/java/$pkgname.jar
	install -Dm0644 "$extracted"/"forge-gui-mobile-dev-$pkgver-jar-with-dependencies.jar" "$pkgdir"/usr/share/java/forge-adventure.jar
	install -Dm0644 "$extracted"/"adventure-editor-jar-with-dependencies.jar" "$pkgdir"/usr/share/java/forge-adventure-editor.jar

	install -Dm0644 "$srcdir/forge-gui-desktop.desktop" "$pkgdir/usr/share/applications/forge-gui-desktop.desktop"
	install -Dm0755 "$srcdir/forge-gui-desktop.sh" "$pkgdir/usr/bin/forge-gui-desktop"

	install -Dm0644 "$srcdir/forge-adventure.desktop" "$pkgdir/usr/share/applications/forge-adventure.desktop"
	install -Dm0755 "$srcdir/forge-adventure.sh" "$pkgdir/usr/bin/forge-adventure"

	install -Dm0644 "$srcdir/forge-adventure-editor.desktop" "$pkgdir/usr/share/applications/forge-adventure-editor.desktop"
	install -Dm0755 "$srcdir/forge-adventure-editor.sh" "$pkgdir/usr/bin/forge-adventure-editor"
}
