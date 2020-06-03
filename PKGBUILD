# Maintainer: Yann Büchau <nobodyinperson@posteo.de>
pkgname=simbuto
pkgver=0.1.21
pkgrel=1
epoch=
pkgdesc="simple budgeting tool"
arch=('any')
url="https://gitlab.com/nobodyinperson/simbuto"
license=('GPL3')
groups=()
depends=('gtk3' 'python-gobject' 'r-optparse')
makedepends=()
makedepends_x86_64=('pandoc')
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
    "https://gitlab.com/nobodyinperson/simbuto/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
    "https://gitlab.com/nobodyinperson/m4-utils/-/archive/master/m4-utils-master.tar.gz"
)
noextract=()
md5sums=('f315d95d432ca05ed741e17eaf86e041'
         '52c5538bb2fc8adcd77c655352711f2f')
validpgpkeys=()

prepare() {
    rm -rf $pkgname-v$pkgver/m4/m4-utils
    mv m4-utils-master/ $pkgname-v$pkgver/m4/m4-utils
}

build() {
	cd "$pkgname-v$pkgver"
    autoreconf --install
    test "`uname -m`" = "x86_64" || configure_flags=--without-manpages
	./configure --prefix=/usr --sysconfdir=/etc $configure_flags
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
