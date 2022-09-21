# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=lidact-git
_pkgname=lidact
pkgver=0.0.1
pkgrel=1
pkgdesc="A tool to execute programs on lid opening/closing."
arch=('x86_64')
url="https://codeberg.org/phranz/lidact"
license=('GPL3')
depends=()
makedepends=('git')
provides=(lidact)
conflicts=(lidact lidact-git)

source=("$_pkgname"::'git+https://codeberg.org/phranz/lidact')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_pkgname}/"
	./configure --prefix=/usr
	make
}

package() {
    cd "$srcdir/${_pkgname}/"
	make DESTDIR="$pkgdir/" install
}
