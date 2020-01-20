# Maintainer: Bailey Kasin <bailey@gingertechnology.net> (https://angrysysadmins.tech)

pkgname=gogios
pkgver=2.2.r1.g10612aa
pkgrel=1
pkgdesc="Checks to see if required services are still running on important machines."
arch=('x86_64')
url="https://github.com/bkasin/gogios"
license=('MIT')

makedepends=('go' 'make')
optdepends=('nginx' 'nmap')

install=${pkgname}.install

source=("$pkgname::git+https://github.com/bkasin/gogios.git#branch=master")
sha256sums=('SKIP')

provides=("$pkgname")
conflicts=("$pkgname-bin")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	make build
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install 
}
