
# Maintainer: Bachir Soussi Chiadmi (scbh at g-u-i dot me)
pkgname=nodebox-git
pkgver=3.0.44.x
pkgrel=2
pkgdesc="Node-based software application for generative design."
arch=('any')
url="https://www.nodebox.net"
license=('GPL2')
depends=('java-environment' 'desktop-file-utils')
makedepends=('git' 'apache-ant' 'java-openjfx')
provides=('nodebox')
source=('git://github.com/nodebox/nodebox.git' 'nodebox.sh' 'nodebox.desktop' 'nodebox.png')
md5sums=('SKIP' 'e60ce94f6d0eac4d93908bb5df3e94eb' 'b4afc4203d2f46459d226d923f93c2f4' '908bb603513778a7d800374027c5b24f')
conflicts=("nodebox")

pkgver() {
	cd "$srcdir/nodebox"
	git describe --long --tags| sed 's/^v//g;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/nodebox/"
	ant resources
}

package() {
	mkdir -p "$pkgdir/opt"
	cp -r "$srcdir/nodebox/dist/resources" "$pkgdir/opt/nodebox"
	install "$srcdir/nodebox/dist/lib/nodebox.jar" "$pkgdir/opt/nodebox/nodebox.jar"
	chmod -R a+rx "$pkgdir/opt/nodebox"
	install -Dm755 nodebox.sh "$pkgdir/usr/bin/nodebox"
	install -Dm644 nodebox.desktop "$pkgdir/usr/share/applications/nodebox.desktop"
	install -Dm644 nodebox.png "$pkgdir/usr/share/pixmaps/nodebox.png"
}
