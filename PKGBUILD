# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=ANDK
_dist=CPAN-Checksums
pkgname=perl-${_dist@L}
pkgver=2.14
pkgrel=1
pkgdesc='Write a CHECKSUMS file for a directory as on CPAN'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-compress-bzip2'
    'perl-data-compare'
    'perl-data-dumper'
    'perl-digest-md5>=2.36'
    'perl-digest-sha'
    'perl-file-temp'
    'perl-io-compress'
    'perl-io>=1.14'
    'perl-module-signature'
    'perl-pathtools'
)
makedepends=('perl-extutils-makemaker')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('4080716c5da7e03b504e3cc0ea1fd5ef9ed6915f6fb737564e9e13d355a89e39')

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
