# Maintainer: Aren <rn+aur@peacevolution.org>

_srcname=cedarlogic
pkgname=cedarlogic-git
pkgver=v2.3.6.r82.d153a75
pkgrel=1
pkgdesc='Free, Open Source Digital Logic Simulator'
arch=('x86_64')
url='https://github.com/CedarvilleCS/CedarLogic'
license=('GPL3')
depends=('wxwidgets-gtk3' 'glu')
makedepends=('git' 'cmake')
provides=("$_srcname")
conflicts=("$_srcname")
source=("$_srcname::git+https://github.com/CedarvilleCS/CedarLogic.git#branch=dev-v2.4")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_srcname"

	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cmake -B build -S "$_srcname" -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
