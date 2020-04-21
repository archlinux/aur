# Maintainer: Bailey Kasin <bailey@gingertechnology.net> (https://angrysysadmins.tech)

pkgname=gogios
pkgver=3.0.0.r0.g041f5a1
pkgrel=2
pkgdesc="Checks to see if required services are still running on important machines."
arch=('x86_64')
url="https://github.com/bkasin/gogios"
license=('MIT')

#makedepends=('go' 'make')
optdepends=(
	'nmap'
	'nginx'
	'sqlite'
	'gogios-plugins')

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
