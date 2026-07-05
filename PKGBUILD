# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Moritz Bunkus <moritz@bunkus.org>

_author=ETHER
_dist=JSON-Any
pkgname=perl-${_dist@L}
pkgver=1.42
pkgrel=1
pkgdesc='(DEPRECATED) Wrapper Class for the various JSON classes'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-constant'
    'perl>=5.6.0'
)
makedepends=(
    # CPAN::Meta::Requirements got split out from CPAN::Meta 2.143240.
    #'perl-cpan-meta-requirements>=2.120620'
    'perl-cpan-meta-requirements'

    'perl-extutils-makemaker'
    'perl-module-metadata'
)
checkdepends=(
    'perl-data-dumper'
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-storable'
    'perl-test-fatal'
    'perl-test-needs'
    'perl-test-simple'
    'perl-test-warnings>=0.009'
    'perl-test-without-module'
    'perl>=5.8.0'
)
optdepends=('perl-cpan-meta>=2.120900')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('babbb638a86758658ca403d953665cda4bc2595d92873604744e903e5ee8c820')

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
