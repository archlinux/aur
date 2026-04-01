# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=HAARG
_dist=Catalyst-Model-DBIC-Schema
pkgname=perl-${_dist@L}
pkgver=0.66
pkgrel=1
pkgdesc='DBIx::Class::Schema Model Class'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp-clan'
    'perl-catalyst-component-instancepercontext'
    'perl-catalyst-devel>=1.0'
    'perl-catalyst-runtime>=5.80005'
    'perl-catalystx-component-traits>=0.14'
    'perl-dbix-class-cursor-cached'
    'perl-dbix-class-schema-loader>=0.04005'
    'perl-dbix-class>=0.08114'
    'perl-hash-merge'
    'perl-list-moreutils'
    'perl-module-runtime>=0.012'
    'perl-moose>=1.12'
    'perl-moosex-markasmethods>=0.13'
    'perl-moosex-nonmoose>=0.16'
    'perl-moosex-types'
    'perl-moosex-types-loadableclass>=0.009'
    'perl-namespace-autoclean>=0.09'
    'perl-namespace-clean'
    'perl-tie-ixhash'
    'perl-try-tiny'
    'perl>=5.8.1'
)
makedepends=(
    'perl-dbd-sqlite'
    'perl-extutils-makemaker>=6.59'
    'perl-module-install'
    'perl-storable'
    'perl-test-exception'
    'perl-test-requires'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('1924f4c00e8f0ff1c5d1afa16efe4f856f1c5e74fe556ec2c5f8f5bf63ad0348')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

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
