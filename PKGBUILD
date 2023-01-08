# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.4.4
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.4.4.tar.gz")
sha512sums=('c17094e3ddb6b6520f8ba4fd4d62763b38f273d188994d06ec54f0455d684e38d027a4614785966e3cf04ced868267c7f7ff96467f2aa6ff64172c2255827514')

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

