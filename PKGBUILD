# Maintainer: Yann Büchau <nobodyinperson at posteo dot de>
pkgname=thunar-custom-actions
pkgver=0.0.22
pkgrel=1
epoch=
pkgdesc="Additional useful custom actions for the Thunar file manager"
arch=('any')
url="https://gitlab.com/nobodyinperson/thunar-custom-actions"
license=('GPL')
groups=()
depends=(
    python
    python-lxml
	bc
	coreutils
	findutils
	ghostscript
	gnupg
	imagemagick
	m4
	make
	perl
	pinentry
	python
	util-linux
	xdg-utils
	zenity
)
makedepends=(
	gettext
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname".install
changelog=
source=(
    "$pkgname-v$pkgver.tar.gz::https://gitlab.com/nobodyinperson/$pkgname/-/archive/make-manpages-optional/$pkgname-make-manpages-optional.tar.gz"
    "https://gitlab.com/nobodyinperson/m4-utils/-/archive/master/m4-utils-master.tar.gz"
)
noextract=()
md5sums=('c6ac9f3ae0b3487eb507d40526d6f52a'
         '52c5538bb2fc8adcd77c655352711f2f')
validpgpkeys=()

prepare() {
	rm -rf "$pkgname-make-manpages-optional"/m4/m4-utils
	mv m4-utils-master/ "$pkgname-make-manpages-optional"/m4/m4-utils
}

build() {
	cd "$pkgname-make-manpages-optional"
	./configure --prefix=/usr PASSWDFILE=/etc/passwd --without-manpages
	make
}

package() {
	cd "$pkgname-make-manpages-optional"
	make DESTDIR="$pkgdir/" install
}
