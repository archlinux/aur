# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
pkgname=lith-git
pkgver=r443.b26c390
pkgrel=1
pkgdesc='A multiplatform WeeChat relay client'
arch=('x86_64')
url='https://github.com/LithApp/Lith'
license=('GPL')
depends=('qt5-base' 'qt5-declarative' 'qt5-websockets' 'qt5-multimedia' 'qt5-quickcontrols2')
makedepends=('git')
source=('git+https://github.com/lithapp/lith.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
        mkdir -p build
        cd build
	qmake ..
        make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
        # The executable has an uppercase L, I think it is sensible to change that to a lowercase l.
	install -D "Lith" "$pkgdir/usr/bin/lith"
}
