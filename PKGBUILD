# Maintainer: pappy <pa314159@users.noreply.github.com>

_cpan_name=WWW-Mechanize-CGI
_cpan_desc='Use WWW::Mechanize with CGI applications.'
_cpan_author=mramberg
_cpan_version=0.3
_cpan_md5=67576d3b49654bce6657f0b3e5eb78d3

pkgrel=2
pkgname=perl-${_cpan_name,,}
pkgdesc=$_cpan_desc
pkgver=$_cpan_version
md5sums=($_cpan_md5)
depends=('perl-www-mechanize' 'perl-http-request-ascgi')
makedepends=('perl-module-build')
checkdepends=('perl-test-simple')

_cpan_path=${_cpan_author:0:1}/${_cpan_author:0:2}/${_cpan_author}

url="http://search.cpan.org/~${_cpan_author}/${_cpan_name}-$pkgver"
source=("http://search.cpan.org/CPAN/authors/id/${_cpan_path^^}/${_cpan_name}-$pkgver.tar.gz")
options=(!emptydirs)
arch=('any')

build() {
	cd $srcdir/${_cpan_name}-$pkgver
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
	make test
}

package() {
	cd $srcdir/${_cpan_name}-$pkgver
	make install DESTDIR=$pkgdir
}

