# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=IVAN
_dist=Business-CreditCard
_ver=0.39
pkgname=perl-${_dist@L}
pkgver=${_ver#v}
pkgrel=1
pkgdesc='Validate/generate credit card checksums/names'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$_ver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-test-simple'
)
makedepends=('perl-extutils-makemaker')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$_ver.tar.gz")
sha256sums=('c7c8a652d2977c8319ea86cd5e1c5be51bd4a6bfc37a5ec5cc0df4345ff450a2')

build()
{
    cd "$_dist-$_ver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
