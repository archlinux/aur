# Maintainer: Pranay Kanwar <pranay.kanwar@gmail.com>
# Maintainer: Anthony25 <anthony.ruhier@gmail.com>

_pkgname=diskscan
pkgname=${_pkgname}-git
pkgver=0.21.r2.g4773146
pkgrel=1
pkgdesc="CLI tool to scan block devices for unreadable sectors"
arch=('i686' 'x86_64')
url="https://github.com/baruch/diskscan"
license=('GPL3')
depends=('python-yaml')
makedepends=('cmake')
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("${pkgname}"::"git+https://github.com/baruch/diskscan.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$srcdir/${pkgname}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
	cd "$srcdir/${pkgname}"
	make
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
