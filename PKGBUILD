# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=ETHER
_dist=MooseX-SimpleConfig
pkgname=perl-${_dist@L}
pkgver=0.11
pkgrel=1
pkgdesc='A Moose role for setting attributes from a simple configuration file'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-config-any>=0.13'
    'perl-moose'
    'perl-moosex-configfromfile'
    'perl>=5.4.0'
)
makedepends=('perl-module-build-tiny>=0.039')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-file-temp'
    'perl-lib'
    'perl-moose'
    'perl-pathtools'
    'perl-test-fatal'
    'perl-test-simple'
    'perl>=5.6.0'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('42c83f4b92ef2785fa8dbcfae69d5d28d5be10141d171472ccf37288682c79ad')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT

    /usr/bin/perl Build.PL --create_packlist=0
    ./Build
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
