# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=fuse-zip
pkgver=0.4.1
pkgrel=1
epoch=
pkgdesc="FUSE file system to navigate, extract, create and modify ZIP and
ZIP64 archives"
arch=('i686' 'x86_64')
url="https://bitbucket.org/agalanin/fuse-zip"
license=('GPL')
groups=()
depends=('fuse' 'libzip')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://bitbucket.org/agalanin/fuse-zip/downloads/$pkgname-$pkgver.tar.gz" "Makefile.patch")
md5sums=('a8fd601f79e8567780ea70a6aa7bf303'
         'a03002585136591f3c99331108104449')
noextract=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p0 -i "$srcdir/Makefile.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make release
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"
	make DESTDIR="$pkgdir" install
}
