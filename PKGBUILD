# Maintainer: Ruben Kelevra <ruben@vfn-nrw.de>

pkgname=perl-class-returnvalue
pkgver=0.55
pkgrel=3
pkgdesc="A smart return value object"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Class-ReturnValue/"
license=('PerlArtistic' 'GPL')
source=('http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/Class-ReturnValue-0.55.tar.gz')
md5sums=('047fbbcfd90d5c399a1feba55781329e')
sha256sums=('ed3836885d78f734ccd7a98550ec422a616df7c31310c1b7b1f6459f5fb0e4bd')
depends=('perl-devel-stacktrace' )
options=(!emptydirs)

prepareEnvironment() {
        cd "$srcdir/$pkgname"
        export \
                PERL_MM_USE_DEFAULT=1 \
                PERL_AUTOINSTALL=--skipdeps \
                PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
                PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
                MODULEBUILDRC=/dev/null
}

build() {
        prepareEnvironment
        /usr/bin/perl Makefile.PL
        make
}

check() {
        prepareEnvironment
        make test
}

package() {
        prepareEnvironment
        make install

        # Remove "perllocal.pod" and ".packlist".
        find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}



