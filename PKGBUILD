# Maintainer: neodarz <neodarz@neodarz.net>

pkgname=libsavitar-git
_pkgname=libSavitar
pkgver=2.6
pkgrel=1
pkgdesc="c++ implementation of 3mf loading with SIP python bindings"
arch=('i686' 'x86_64')
url="https://github.com/Ultimaker/$_pkgname"
license=('AGPL')
makedepends=(git)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname"::"git+https://github.com/Ultimaker/$_pkgname.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "$pkgname"
    mkdir build
    cd build
	cmake -DBUILD_STATIC=ON -DCMAKE_INSTALL_PREFIX=/usr/lib/python3.6/site-packages/ ..
	make
}

package() {
	cd "$pkgname"
    cd build
    make DESTDIR="$pkgdir/" install
}
