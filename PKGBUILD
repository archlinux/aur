# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=JJNAPIORK
_dist=CatalystX-Profile
pkgname=perl-${_dist@L}
pkgver=0.02
pkgrel=1
pkgdesc='Profile your Catalyst application with Devel::NYTProf'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-catalyst-runtime>=5.80020'
    'perl-catalystx-injectcomponent>=0.024'
    'perl-devel-nytprof>=3.01'
    'perl-moose>=0.93'
    'perl-namespace-autoclean>=0.09'
    'perl-sub-identify>=0.04'
)
makedepends=('perl-extutils-makemaker>=6.30')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('151a352333a6d26626d9001bb7e3b3a11cd4251a191111da60a9657eb66acd6c')

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
