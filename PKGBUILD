# Maintainer: Spencer Harmon <spencer dot harmon at higher-state dot com>

pkgname="perl-splat-git"
_realname="SPLAT"
pkgver=1.004.r0.g266d711
pkgrel=1
epoch=
pkgdesc="SPLAT programming language for the MFM simulator."
arch=('any')
url="https://www.github.com/daveackley/SPLAT"
license=('GPL3')
groups=()
depends=('perl'
	'perl-file-sharedir'
	'ulam-git')
makedepends=('make'
	'perl-file-sharedir-install'
	'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!buildflags' '!makeflags')
install=
changelog=
source=("git://www.github.com/daveackley/SPLAT")
noextract=()
md5sums=('SKIP')

pkgver(){
	cd $srcdir/${_realname}
	git describe --long | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	pushd ${_realname}

	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
		PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
		MODULEBUILDRC=/dev/null

	/usr/bin/perl Makefile.PL
}

build() {
	pushd ${_realname}

	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir/'" \
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir/'" \
		PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
		MODULEBUILDRC=/dev/null

	make
	make test
}

package() {
	pushd ${_realname}

	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir/'" \
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir/'" \
		PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
		MODULEBUILDRC=/dev/null

	make install
}
