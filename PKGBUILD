# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=ETHER
_dist=Task-Kensho-ModuleDev
pkgname=perl-${_dist@L}
pkgver=0.41
pkgrel=1
pkgdesc='A Glimpse at an Enlightened Perl: Module Development'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-code-tidyall'
    'perl-cpan-uploader'
    'perl-data-dumper-concise'
    'perl-data-printer'
    'perl-devel-confess'
    'perl-devel-nytprof'
    'perl-dist-zilla'
    'perl-modern-perl'
    'perl-module-build-tiny'
    'perl-perl-critic'
    'perl-pod-readme'
    'perl-software-license'
    'perl-tidy'
    'perl>=5.6.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-test-simple'
    'perl>=5.6.0'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('319d55edbd578457410b7f8070620e94606ce09da20bbe9fb62c5b1000520e43')

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
