# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Anton Leontiev <scileont /at/ gmail.com>

_author=ETHER
_dist=MooseX-Getopt
pkgname=perl-${_dist@L}
pkgver=0.78
pkgrel=3
pkgdesc='A Moose role for processing command line options'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-getopt-long-descriptive>=0.088'
    'perl-getopt-long>=2.37'
    'perl-moose'
    'perl-moosex-role-parameterized>=1.01'
    'perl-namespace-autoclean'
    'perl-scalar-list-utils'
    'perl-try-tiny'
    'perl>=5.6.0'
)
makedepends=('perl-module-build-tiny>=0.034')
checkdepends=(
    'perl-if'
    'perl-module-metadata'
    'perl-module-runtime'
    'perl-moose'
    'perl-path-tiny>=0.009'
    'perl-pathtools'
    'perl-test-deep'
    'perl-test-fatal>=0.003'
    'perl-test-needs'
    'perl-test-simple'
    'perl-test-trap'
    'perl-test-warnings>=0.009'
    'perl>=5.6.0'
)
optdepends=(
    'perl-cpan-meta'
    'perl-json-pp'
    'perl-moosex-configfromfile'
    'perl-moosex-simpleconfig'
    'perl-moosex-strictconstructor'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('7ae89620f38827dbad2313a4e5f734049958f5d6212bd62abdbcb8ae936dcbc7')

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
