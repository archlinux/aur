# Maintainer: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme
pkgver=7.2.6
pkgrel=1
pkgdesc='A monotone line-based icon pack for android - freedesktop version'
arch=('any')
optdepends=('inkscape: for generationg the symbolic icons')
url='https://github.com/Donnnno/Arcticons'
license=('GPL3')
options=(!strip)
provides=('arcticons-icon-theme')
conflicts=('arcticons-icon-theme')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('d10f8d7ff3d6eeb69ec2c695300dd75ded50ab2b31ddb731f7685656601f77c2bcaac136aa205ff1af2b7ca5a8ee29d79857173991a78d3fe090559edfcb094b')

build() {
	cd "$srcdir/Arcticons-${pkgver}/freedesktop-theme"
	rm -rf arcticons-dark arcticons-light
	./generate.sh white 2
	mv arcticons arcticons-dark
	sed -e s/Arcticons/Arcticons-dark/g -e s/breeze/breeze-dark/g index.theme > arcticons-dark/index.theme
	./generate.sh black 2
	mv arcticons arcticons-light
	rm arcticons.tar.gz
}

package() {
	cd "$srcdir/Arcticons-${pkgver}/freedesktop-theme"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	cd "$srcdir/Arcticons-${pkgver}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
