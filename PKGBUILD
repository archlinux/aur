# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish-git
_pkgname=guish
pkgver=2.0.0.r2.g327ee98
pkgrel=1
pkgdesc="A versatile graphical DSL and army knife to make and modify GUIs (newer 2.x version)."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst')
makedepends=('git' 'libx11' 'libxtst')
provides=(guish)
conflicts=(guish guish-git)

source=("$_pkgname"::'git+https://codeberg.org/phranz/guish')
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
