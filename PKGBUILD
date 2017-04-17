# Maintainer: Viktor Hundahl Strate <viktorstrate@gmail.com>

gitname=tinyMediaManager

pkgname=tiny-media-manager
pkgver=2.9.3.1
pkgrel=2
pkgdesc="A multi-OS media managment tool"
arch=('any')
url="http://www.tinymediamanager.org"
license=('Apache-2.0')
depends=('libmediainfo' 'java-environment>=8')
makedepends=('maven')
source=("https://github.com/tinyMediaManager/tinyMediaManager/archive/$gitname-$pkgver.tar.gz"
			  "tinyMediaManager.desktop"
				"tinymediamanager"
				"tinymediamanager-cli")
md5sums=('209bf1437101d1e5df5af545628bbdb5'
         '4a8fd16c1295e18ec4fe9c0a8ad61d87'
         '8f4e0cc5eac31bf05bf273fd78d654cf'
         '9bead0995ae09ac68850a83159b1b70d')

build() {
	cd "$gitname-$gitname-$pkgver"
	mvn package
}

package() {
	mkdir -p "$pkgdir/usr/share/$gitname"
	cd "$srcdir/$gitname-$gitname-$pkgver/dist"

	tar -xvf tmm_"$pkgver"_*_linux.tar.gz
	rm tmm_"$pkgver"_*_linux.tar.gz

	cp -r * "$pkgdir/usr/share/$gitname"
	chmod -R 777 "$pkgdir/usr/share/$gitname"

	# Install desktop entry
	install -D "$srcdir/tinyMediaManager.desktop" "$pkgdir/usr/share/applications/tinyMediaManager.desktop"

	# Install launch scripts
	install -D "$srcdir/tinymediamanager-cli" "$pkgdir/usr/bin/tinymediamanager-cli"
	install -D "$srcdir/tinymediamanager" "$pkgdir/usr/bin/tinymediamanager"
}
