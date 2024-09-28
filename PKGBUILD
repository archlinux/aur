# Maintainer: Filip Markovic <f12markovic at gmail dot com>
_pkgname="nmcurse"
pkgname="$_pkgname-git"
pkgver=8.3501282
pkgrel=1
pkgdesc="Curses interface for NetworkManager"
arch=(x86_64 aarch64)
url="https://github.com/vilari-mickopf/$_pkgname"
depends=('git' 'make' 'cmake' 'networkmanager')
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    mkdir -p build && cd build
    cmake ..
    make -j
}

package() {
    cd "$srcdir/${_pkgname}/build"
    make DESTDIR="$pkgdir" install
}
