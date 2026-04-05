# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=ETHER
_dist=aliased
pkgname=perl-${_dist@L}
pkgver=0.34
pkgrel=3
pkgdesc='Use shorter versions of class names.'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-exporter'
    'perl>=5.6.0'
)
makedepends=('perl-module-build-tiny>=0.039')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-if'
    'perl-lib'
    'perl-pathtools'
    'perl-test-simple'
    'perl>=5.6.0'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('c350524507cd827fab864e5d4c2cc350b1babaa12fa95aec0ca00843fcc7deeb')

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
