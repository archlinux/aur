# Maintainer: Spencer Harmon <spencer at rsitex dot com>

pkgname="ulam-git"
pkgver=2.0.13
pkgrel=1
epoch=
pkgdesc="Github version of ulam compiler and MFM simulator"
arch=('any')
url="https://github.com/elenasa/ULAM/wiki"
license=('(L)GPL3')
groups=()
depends=('gcc'
	'perl'
	'sdl_ttf'
	'perl-crypt-openssl-rsa'
	'perl-capture-tiny')
makedepends=('make' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!buildflags' '!makeflags')
install=
changelog=
source=("git://github.com/spencerharmon/MFM"
        "git://github.com/spencerharmon/ULAM")
noextract=()
md5sums=('SKIP' 'SKIP')

prepare() {
	make -C MFM
	make -C ULAM
	perl ULAM/share/perl/extractDistro.pl bin . "$srcdir/ulam" ulam
	perl ULAM/share/perl/extractDistro.pl src . "$srcdir/ulam" ulam
}

build() {
	make -C ulam
}

package() {
	make -C "$srcdir/ulam" DESTDIR="$pkgdir/" install
}
