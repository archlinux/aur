# Maintainer: John Maguire <contact@johnmaguire.me>
pkgname=qllauncher-next-git
pkgver=beta.82.gd3cfdac
pkgrel=2
pkgdesc="Third party standalone launcher for Quake Live (next branch)"
arch=('i686' 'x86_64')
url="https://bitbucket.org/fx_/quakelivelauncher"
license=('GPL3')
depends=('wine' 'libfxqllauncher' 'libfxqmlcontrols' 'libfxqmlhelpers' 'qt5-svg')
makedepends=('git' 'qt5-base<=5.5' 'qt5-declarative')
provides=('qllauncher')
conflicts=('qllauncher-git')
install="$pkgname.install"
source=("$pkgname::git+https://bitbucket.org/fx_/quakelivelauncher.git#branch=next")

sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed "s/-/./g"
}

build() {
	cd "$srcdir/$pkgname"
	qmake qllauncher.pro
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -dm755 "$pkgdir/opt/$pkgname/"
	install -d "$pkgdir/usr/bin/"
	cp -r {ui,sounds} "$pkgdir/opt/$pkgname/"
	install -Dm755 qllauncher "$pkgdir/opt/$pkgname/qllauncher"
	ln -s "/opt/$pkgname/qllauncher" "$pkgdir/usr/bin/qllauncher"
	install -Dm644 "qllauncher.desktop" "$pkgdir/usr/share/applications/qllauncher.desktop"
	install -Dm644 ui/images/quakelivelogo.png "$pkgdir/usr/share/pixmaps/quakelivelogo.png"
}
