# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=MIKO
_dist=Debug-ShowStuff
pkgname=perl-${_dist@L}
pkgver=1.16
pkgrel=2
pkgdesc='Debug::ShowStuff - A collection of handy debugging routines for displaying the values of variables with a minimum of coding.'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-class-isa'
    'perl-devel-stacktrace'
    'perl-scalar-list-utils'
    'perl-string-util'
    'perl-term-readkey'
    'perl-text-tabulardisplay'
    'perl-tie-ixhash'
    'perl>=5.3.0'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('a4dd5d2cd7db8ea6e4861b193e024b4187a2b0ed2b99d587062dfb11a5cd2cb7')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
