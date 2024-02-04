# Maintainer: pappy <pa314159@users.noreply.github.com>

_cpan_name=Spawn-Safe
_cpan_desc='Fork and exec a process "safely"'
_cpan_author=jeagle
_cpan_version=2.006
_cpan_md5=df585d11c7ff316fb736e6718fe9e639

pkgrel=1
pkgname=perl-${_cpan_name,,}
pkgdesc=$_cpan_desc
pkgver=$_cpan_version
md5sums=($_cpan_md5)
makedepends=('perl-module-build')
checkdepends=('perl-test-simple')

_cpan_path=${_cpan_author:0:1}/${_cpan_author:0:2}/${_cpan_author}

url="http://search.cpan.org/~${_cpan_author}/${_cpan_name}-$pkgver"
source=("http://search.cpan.org/CPAN/authors/id/${_cpan_path^^}/${_cpan_name}-$pkgver.tar.gz")
options=(!emptydirs)
arch=('any')

build() {
	cd $srcdir/${_cpan_name}
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
	make test
}

package() {
	cd $srcdir/${_cpan_name}
	make install DESTDIR=$pkgdir
}

