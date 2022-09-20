# Maintainer: Aditya Mishra <adityamishra081@protonmail.com>

pkgname=dotto
pkgver=6dea00
pkgrel=5
pkgdesc="a pixel art editor (Very Unstable, Under Heavy Development)"
arch=('any')
url="https://github.com/LibreSprite/Dotto"
license=('MIT')
depends=(sdl2 sdl2_image)
makedepends=(git make pkg-config lcms2)
optdepends=()
provides=('dotto')
conflicts=('dotto' 'dotto-git')
source=(git+https://github.com/LibreSprite/Dotto.git)
sha512sums=(SKIP)

pkgver() {
	cd Dotto
	git describe --always --dirty --abbrev=6 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd Dotto
	git submodule update --init --recursive
	make -j4
}

package() {
	cd Dotto
	mkdir -p "$pkgdir/opt/Dotto/"
	find data/ -type f -exec install -Dm 755 "{}" "$pkgdir/opt/Dotto/{}" \;
	install -Dm644 data/Dotto.desktop "$pkgdir/usr/share/applications/Dotto.desktop"
	install -Dm644 data/icon.png "$pkgdir/usr/share/icons/dotto.png"
	install -Dm755 dotto "$pkgdir/opt/Dotto/dotto"
}
