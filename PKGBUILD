# Maintainer: Giuseppe Crino' <giuscri@gmail.com>
pkgname="perl-test-more-git"
pkgver="r2096.816b2b12"
pkgrel=1
pkgdesc="Test2, Test::More, Test::Simple and Test::Builder Perl modules for writing tests"
arch=('x86_64')
url="https://github.com/Test-More/test-more/"
license=('GPL')
depends=('perl')
makedepends=('git')
provides=("perl-test-more")
conflicts=("perl-test-more")
source=("$pkgname::git://github.com/Test-More/test-more.git")
md5sums=('SKIP')
options=('!emptydirs' purge)

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
    /usr/bin/perl Makefile.PL
    make
}

check() {
	cd "$srcdir/$pkgname"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1
    make test
}

package() {
	cd "$srcdir/$pkgname"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# vim: set noet:
