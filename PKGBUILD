# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=RWSTAUNER
_dist=Dist-Metadata
pkgname=perl-${_dist@L}
pkgver=0.927
pkgrel=1
pkgdesc='Information about a perl module distribution'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-archive-tar>=1'
    'perl-archive-zip>=1.30'
    'perl-carp'
    'perl-cpan-distnameinfo>=0.12'
    'perl-cpan-meta>=2.1'
    'perl-digest-md5>=2'
    'perl-digest-sha>=5'
    'perl-digest>=1.03'
    'perl-file-spec-native>=1.002'
    'perl-file-temp>=0.19'
    'perl-module-metadata'
    'perl-parent'
    'perl-path-class>=0.24'
    'perl-scalar-list-utils'
    'perl-try-tiny>=0.09'
    'perl>=5.6.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-file-temp>=0.19'
    'perl-io'
    'perl-pathtools'
    'perl-test-fatal'
    'perl-test-mockobject>=1.09'
    'perl-test-simple'
    'perl>=5.6.0'                 # Package is flagged out-of-date on 2026-03-30.
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('ad24bc60cc6743148b6935e9ec55737d9380374c26571946ab9c3123964cd0be')

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
