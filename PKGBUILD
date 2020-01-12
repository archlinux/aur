# Maintainer: Yann Büchau <nobodyinperson@posteo.de>
pkgname=simbuto
pkgver=0.1.20
pkgrel=1
epoch=
pkgdesc="simple budgeting tool"
arch=('any')
url=""
license=('GPL3')
groups=()
depends=('python' 'r-optparse')
makedepends=('pandoc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://gitlab.com/nobodyinperson/simbuto/-/archive/v$pkgver/simbuto-v$pkgver.tar.gz"
    "https://gitlab.com/nobodyinperson/m4-utils/-/archive/master/m4-utils-master.tar.gz"
)
noextract=()
md5sums=(
    '1dd39972461a65c8221a6b5d2cf79f28'
    '52c5538bb2fc8adcd77c655352711f2f'
)
validpgpkeys=()

prepare() {
    rm -rf simbuto-v$pkgver/m4/m4-utils
    mv m4-utils-master/ simbuto-v$pkgver/m4/m4-utils
}

build() {
	cd "$pkgname-v$pkgver"
    autoreconf --install
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-v$pkgver"
	make -k check
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" install
}
