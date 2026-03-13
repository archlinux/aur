# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=REHSACK
_dist=Unix-Statgrab
_ver=0.112
pkgname=perl-${_dist@L}
pkgver=${_ver#v}
pkgrel=1
pkgdesc='Perl extension for collecting information about the machine'
arch=('x86_64')
url=https://metacpan.org/release/$_author/$_dist-$_ver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later OR LGPL-2.1-or-later')
depends=(
    'libstatgrab>=0.90'
    'perl'
    'perl-carp'
    'perl-file-path>=2.00'
    'perl-pathtools'
)
makedepends=(
    'perl-capture-tiny>=0.06'
    'perl-config-autoconf>=0.317'
    'perl-extutils-cbuilder>=0.27'
    'perl-extutils-constant>=0.21'
    'perl-extutils-makemaker'
    'perl-parent'
    'perl-pathtools'
    'perl-text-parsewords'
)
checkdepends=('perl-test-simple')
optdepends=('perl-test-leaktrace')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$_ver.tar.gz")
sha256sums=('16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669b837745f3ea61d6afa')

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
