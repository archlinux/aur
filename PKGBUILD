# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła <micwoj9292@gmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=SHLOMIF
_dist=Digest-JHash
pkgname=perl-${_dist@L}
pkgver=0.10
pkgrel=2
pkgdesc='Perl extension for 32 bit Jenkins Hashing Algorithm'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('Artistic-2.0')
depends=(
    'perl-exporter'
    'perl>=5.8.0'
)
makedepends=(
    'perl-extutils-makemaker'
    'perl-file-temp'
    'perl-io'
    'perl-pathtools'
    'perl-test'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('c746cf0a861a004090263cd54d7728d0c7595a0cf90cbbfd8409b396ee3b0063')

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
