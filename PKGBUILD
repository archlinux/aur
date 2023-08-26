# Maintainer: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme-git
pkgver=7.0.0.r5.g2c4761b2f
pkgrel=1
pkgdesc='A monotone line-based icon pack for android - freedesktop version (git version)'
arch=('any')
url='https://github.com/Donnnno/Arcticons'
license=('GPL3')
options=(!strip)
provides=('arcticons-icon-theme')
conflicts=('arcticons-icon-theme')
source=('git+https://github.com/Donnnno/Arcticons.git')
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/Arcticons"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/Arcticons/freedesktop-theme"
	./generate.sh white 2
	mv arcticons arcticons-dark
	./generate.sh black 2
	mv arcticons arcticons-light
	rm arcticons.tar.gz
}

package() {
	cd "$srcdir/Arcticons/freedesktop-theme"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	cd "$srcdir/Arcticons"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
