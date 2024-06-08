# Maintainer: realroot <scorpion2185@protonmail.com>

pkgname=auralquiz
pkgver=1.0.0
pkgrel=1
pkgdesc="Quiz game about your music."
arch=('x86_64')
url="https://gitlab.com/auralquiz/auralquiz-dev"
license=('GPL-2.0-or-later')
makedepends=('qt5-base' 'make' 'git' 'gcc' 'taglib')
depends=('qt5-base' 'phonon-qt5-vlc')
#optdepends=('')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/auralquiz/auralquiz-dev/-/archive/${pkgver}/${pkgname}-dev-${pkgver}.tar.gz")

sha512sums=('49bc50052c93a4b43cab928346d9837dedd5f450fbed6d84d7b781e0d1928012f64fd4b2bcbbc891b0d235711fd6d3952238da719412a7c1b21de7fb188a37db')

build() {
	cd "$pkgname"-dev-"$pkgver"
	mkdir build
	cd build
	qmake ..
	make
}

package() {
	cd "$pkgname"-dev-"$pkgver"
	install -Dm644 icon/64x64/auralquiz.png "$pkgdir"/usr/share/icons/hicolor/64x64/apps/auralquiz.png
	install -Dm644 auralquiz.desktop "$pkgdir"/usr/share/applications/auralquiz.desktop
	install -Dm644 manual/auralquiz.6 "$pkgdir"/usr/share/man/man6/auralquiz.6
	install -Dm755 build/auralquiz "$pkgdir"/usr/bin/auralquiz
}
