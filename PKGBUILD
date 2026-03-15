# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=LEONT
_dist=App-find2perl
pkgname=perl-${_dist@L}
pkgver=1.005
pkgrel=2
pkgdesc='translate find command lines to Perl code'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-pathtools'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-constant'
    'perl-devel-findperl>=0.009'
    'perl-file-path'
    'perl-file-temp'
    'perl-io'
    'perl-pathtools'
    'perl-perl-ostype'
    'perl-test-simple'
    'perl>=5.6.0'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('d72ce76f796c4b61f7fc1a22a39aceab08347aa45de10b0d7c08d468822bc94b')

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
