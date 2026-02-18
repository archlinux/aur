# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>

_dist=File-XDG
pkgname=perl-file-xdg
pkgver=1.03
pkgrel=1
pkgdesc='Basic implementation of the XDG base directory specification'
arch=('any')
url='https://metacpan.org/module/File::XDG'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-file-path>=2.07'
    'perl-path-class'
    'perl-path-tiny'
    'perl-ref-util'
    'perl>=5.6.0'
)
checkdepends=(
    'perl-file-path>=2.07'
    'perl-file-temp'
    'perl-path-class>=0.26'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/$_dist-$pkgver.tar.gz")
sha256sums=('88bd7c1458cb763beced6e7bd0c11972a156b1e39232984f8a7a8be4206bf7ce')

build()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL
    make
}


check()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    make test
}

package()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
    find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
