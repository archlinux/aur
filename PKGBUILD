# Maintainer: Ye Jingchen <ye.jingchen@gmail.com>
pkgname=mpvconfigurator
pkgver=0.2
pkgrel=1
pkgdesc="Generate config for MPV using GUI"
arch=('x86_64')
url="https://github.com/haasnhoff/mpvconfigurator"
license=('GPL2')
depends=(qt5-base)
makedepends=()
conflicts=('mpvconfigurator-git')
options=()
install=
source=("mpvconfigurator-$pkgver.tar.gz::https://github.com/haasnhoff/mpvconfigurator/archive/$pkgver.tar.gz"
        "remove-tempfix-ui.patch")
sha256sums=('06ede788f05ac97cddbf98f917f17f8271a2db5e4088b380c7ca1570867607b0'
            '9b7666548b43e19465feb3f8ddd56b6b5b59a17026880b7c424c78d2bd09cf69')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np0 -i "$srcdir/remove-tempfix-ui.patch"
}

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	qmake -o Makefile ../src/mpvconfigurator.pro
	make -j$(nproc)
}

package() {
	cd "$pkgname-$pkgver/build"
	install -Dm755 mpvconfigurator "$pkgdir/usr/bin/mpvconfigurator"
}
