# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła <micwoj9292@gmail.com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: Vadim Abramchuk <abramm@gmail.com>

_dist=Net-CIDR
_ver=0.27
pkgname=perl-${_dist,,}
pkgver=${_ver#v}
pkgrel=1
pkgdesc='Manipulate IPv4/IPv6 netblocks in CIDR notation'
arch=('any')
url=https://metacpan.org/release/MRSAM/$_dist-$_ver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-carp'
)
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MR/MRSAM/$_dist-$_ver.tar.gz")
sha256sums=('9e950fef4422264dc8efab30dbbd3ce2be125e61b3f5c50111d15506d3b570e3')

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
