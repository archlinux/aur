# Maintainer:	Simon Legner <Simon.Legner@gmail.com>
# Maintainer:	Filippo Berto <berto.f at protonmail dot com>
# Contributor: Viktor Hundahl Strate <viktorstrate@gmail.com>

_gitname=tinyMediaManager

pkgname=tiny-media-manager
pkgver=2.9.14
pkgrel=1
pkgdesc="A multi-OS media managment tool"
arch=('any')
url="https://www.tinymediamanager.org/"
license=('Apache')
depends=('libmediainfo' 'java-environment>=8')
makedepends=('maven' 'git') # git for org.codehaus.mojo:buildnumber-maven-plugin
install=tinyMediaManager.install
source=("https://github.com/tinyMediaManager/tinyMediaManager/archive/$_gitname-$pkgver.tar.gz"
        "tinyMediaManager.install"
			  "tinyMediaManager.desktop"
				"tinymediamanager"
				"tinymediamanager-cli")

build() {
	cd "$_gitname-$_gitname-$pkgver"
	mvn package
}

package() {
	cd "$srcdir/$_gitname-$_gitname-$pkgver/dist"

	tar -xf tmm_"$pkgver"_*_linux.tar.gz
	mkdir -p "$pkgdir/usr/share/$_gitname"
	cp -r {lib/,locale/,plugins/,templates/,splashscreen.png,tmm.jar,tmm.png} "$pkgdir/usr/share/$_gitname"

	# Install desktop entry
	install -D "$srcdir/tinyMediaManager.desktop" "$pkgdir/usr/share/applications/tinyMediaManager.desktop"

	# Install launch scripts
	install -D "$srcdir/tinymediamanager-cli" "$pkgdir/usr/bin/tinymediamanager-cli"
	install -D "$srcdir/tinymediamanager" "$pkgdir/usr/bin/tinymediamanager"
}

sha256sums=('9710363902ff3fe26452524bcf70954ec5961ede4e311da2693eceb8335a3186'
            '49bd16ee848ae21f1c02e408469e5c09c253e6ffe353d7e65434298a1092f010'
            '02bbfd492d10114cd314fc24fd7016532b0b992077d722d8bfccc4f99a79b7a3'
            'ea43080cfcd656642275b7f7fe81233b2cc872c0cd6301f28eed5f7b9d236b2a'
            '07e803e2fbf980c8e5c4e957a52ea00de605cebc5e28bfd70730168b87723f77')
