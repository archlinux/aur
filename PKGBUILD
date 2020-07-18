# Maintainer: Romeo Calota <mail@romeocalota.me>
pkgname='joyshockmapper-git'
_pkgname='joyshockmapper'
pkgver=v1.6.1.r1.gdeff884
pkgrel=1
pkgdesc='Play PC games with Sony PlayStation DualShock 4, Nintendo Switch JoyCons or Nintendo Switch Pro Controller using gyroscopic controls'
arch=('any')
url='http://gyrowiki.jibbsmart.com/'
license=('MIT')
groups=()
makedepends=('cmake' 'clang')
depends=('libevdev' 'hidapi' 'gtkmm3' 'libappindicator-gtk3')
optdepends=('libx11: autoload configuration based on focused window')
conflicts=("joyshockmapper" "joyshockmapper-git")
provides=("${_pkgname}")
source=("git+https://github.com/JibbSmart/JoyShockMapper")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/JoyShockMapper"

	git describe --tags \
		| sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/JoyShockMapper
    mkdir build && cd build
	cmake .. \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr/
    make
}

package() {
	cd ${srcdir}/JoyShockMapper/build
    DESTDIR=${pkgdir} make install
    rm ${pkgdir}/usr/lib/*.a
}