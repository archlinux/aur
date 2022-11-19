# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish-git
_pkgname=guish
pkgver=2.2.0.r0.g45d5925
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs (development version)."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
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
