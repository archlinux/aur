# Maintainer: Anthony25 <anthony.ruhier@gmail.com>

_name=diskscan
pkgname=${_name}-git
pkgver=0.19.r7.gd3433ce
pkgrel=1
pkgdesc="CLI tool to scan block devices for unreadable sectors"
arch=('i686' 'x86_64')
_url="github.com/baruch/diskscan"
url="https://${_url}"
license=('GPL3')
depends=('python-yaml')
makedepends=('cmake')
conflicts=("${_name}")
replaces=("${_name}")
source=("git://${_url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/${_name}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$srcdir/${_name}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
	cd "$srcdir/${_name}"
	make
}

package() {
	cd "$srcdir/${_name}"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
