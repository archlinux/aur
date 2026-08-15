# Maintainer: myaow at catgirls dot org dot es

_pkgname=svg2oscad
pkgname=$_pkgname-git
pkgver=1.0_22_g51adb02
pkgrel=1
pkgdesc="Convert SVG files to OpenSCAD paths"
arch=('any')
url="https://catgirls.org.es/myaow/svg2oscad"
license=('custom:Myaow')
depends=('java-runtime>=21')
optdepends=('inkscape: SVG export extension')
makedepends=('maven' 'java-environment>=21' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --tags --long | sed 's/^v//; s/-/_/g'
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make install-nobuild PREFIX=/usr DESTDIR="$pkgdir"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE.txt"
}
