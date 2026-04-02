# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=ILMARI
_dist=Catalyst-Authentication-Store-DBIx-Class
pkgname=perl-${_dist@L}
pkgver=0.1506
pkgrel=2
pkgdesc='A storage class for Catalyst Authentication using DBIx::Class'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-catalyst-model-dbic-schema>=0.18'
    'perl-catalyst-plugin-authentication>=0.10008'
    'perl-catalyst-runtime>=5.8'
    'perl-dbix-class>=0.08'
    'perl-list-moreutils'
    'perl-moose'
    'perl-namespace-autoclean'
    'perl-try-tiny'
    'perl>=5.8.1'
)
makedepends=(
    'perl-extutils-makemaker>=6.59'
    'perl-module-install'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('7c579f2595285e64c3dcb5540334aa9a002443e1d4c8c83ab4493b90cc51b244')

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
