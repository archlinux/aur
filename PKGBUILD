# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Christoph Brill <egore911@gmail.com>
_pkgname=evtest-qt
pkgname=${_pkgname}-git
pkgver=r112.46297da
pkgrel=1
pkgdesc="Linux Joystick Tester for Qt"
arch=('i686' 'x86_64')
url="https://gitlab.com/evtest-qt/${_pkgname}"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake' 'git' 'tinycmmc')
source=("git+${url}.git")
md5sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver()  {
	printf "r%s.%s" "$(git -C ${_pkgname} rev-list --count HEAD)" "$(git -C ${_pkgname} rev-parse --short HEAD)"
}

build() {
	mkdir -p "$srcdir/${_pkgname}/build"
	cd "$srcdir/${_pkgname}/build"
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
        cd "$srcdir/${_pkgname}/build"
        make DESTDIR="$pkgdir/" install
}

