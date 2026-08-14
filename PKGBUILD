# Maintainer: myaow at catgirls dot org dot es

pkgname=svg2oscad
pkgbase=svg2oscad-git
pkgver=r92.b9b0430
pkgrel=1
pkgdesc="Convert SVG files to OpenSCAD paths"
arch=('any')
url="https://catgirls.org.es/myaow/svg2oscad"
license=('custom:Myaow')
depends=('java-runtime>=21')
optdepends=('inkscape: SVG export extension')
makedepends=('maven' 'java-environment>=21' 'git')
provides=("$pkgname")
conflicts=("$pkgname")
options=('!strip' '!debug')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	local commits short
	commits="$(git rev-list --count HEAD)"
	short="$(git rev-parse --short HEAD)"
	printf 'r%s.%s' "$commits" "$short"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make install-nobuild PREFIX=/usr DESTDIR="$pkgdir"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
