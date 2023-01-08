# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.4.3
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.4.3.tar.gz")
sha512sums=('9a715a01ecbb65a3727e091238b33174d10b118c29fb9fabf115364625be1951bf9f9e3b89388ed914772be5d898f7780ec940a3d3053b982e1645bf817eff51')

build() {
    cd "${pkgname}"
	make ENABLE_X11=1 ENABLE_CONTROL=1 ENABLE_IMAGES=1
}

check() {
    cd "${pkgname}"
    make tests
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}

