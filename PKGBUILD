# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

_author=BDFOY
_dist=Net-SSH-Perl
pkgname=perl-${_dist@L}
pkgver=2.144
pkgrel=2
pkgdesc='Perl client Interface to SSH'
arch=('x86_64')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-crypt-curve25519>=0.05'
    'perl-crypt-idea'
    'perl-cryptx>=0.032'
    'perl-digest-md5'
    'perl-file-homedir'
    'perl-io'
    'perl-math-gmp>=1.04'
    'perl-pathtools'
    'perl-scalar-list-utils'
    'perl-string-crc32>=1.2'
    'perl>=5.10.0'
)
makedepends=(
    'perl-extutils-makemaker>=6.64'
    'perl-pathtools'
)
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('2b547bba3336ae324a6a23c4a265e01b9b0d6eeaf7a457205c605387d713e93e')

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
