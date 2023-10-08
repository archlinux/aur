# Maintainer: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme
pkgver=7.3.7
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
sha512sums=('e6f71d107a95b4f96c820fb1729f9079b2406854bf516f299a701caacc3896e269aeae263055a1ff7d28c82150d266d0772b7281c867784cf2852ca7cb6b95fd')

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
