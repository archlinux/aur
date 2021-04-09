pkgname=gloc-git
pkgver=v1.000.r0.42d2c37
pkgrel=1
pkgdesc="GNU/Linux Overdrive/EMusic Client"
arch=('any')
url="https://github.com/jvolkening/gloc"
license=('GPL3')
depends=('perl-file-homedir' 'perl-gtk3' 'perl-io-socket-ssl' 'perl-html-parser' 'perl-html-tiny' 'perl-xml-simple' 'perl-net-ssleay')
makedepends=('perl-test-pod' 'git')
options=('emptydirs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('gloc::git+https://github.com/jvolkening/gloc.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
    /usr/bin/perl Makefile.PL
    make
}

check() {
	cd "$srcdir/${pkgname%-git}"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1
    make test
}

package() {
	cd "$srcdir/${pkgname%-git}"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
