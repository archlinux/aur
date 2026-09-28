# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=ABRAXXA
_dist=HTML-FormHandler
pkgname=perl-${_dist@L}
pkgver=0.410002
pkgrel=1
pkgdesc='HTML forms using Moose'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-carp'
    'perl-class-load>=0.06'
    'perl-data-clone'
    'perl-datetime'
    'perl-datetime-format-strptime'
    'perl-email-valid'
    'perl-file-sharedir'
    'perl-html-parser'
    'perl-html-tree>=3.23'
    'perl-json-maybexs>=1.003003'
    'perl-locale-maketext>=1.09'
    'perl-moose>=2.1403'
    'perl-moosex-types-common'
    'perl-moosex-types-loadableclass>=0.006'
    'perl-moosex-types>=0.20'
    'perl-namespace-autoclean>=0.09'
    'perl-pathtools'
    'perl-scalar-list-utils>=1.33'
    'perl-sub-exporter'
    'perl-sub-name'
    'perl-try-tiny'
)
makedepends=(
    'perl-extutils-makemaker'
    'perl-file-sharedir-install>=0.06'
)
checkdepends=(
    'perl-padwalker'
    'perl-test-differences'
    'perl-test-exception'
    'perl-test-memory-cycle>=1.04'
    'perl-test-needs'
    'perl-test-simple'
    'perl-test-warn'
)
optdepends=(
    'perl-crypt-blowfish'
    'perl-crypt-cbc'
    'perl-mime-base64'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('c13de7e4f2c3995e50475c629529b654cf9e2c627bdd62e27ea48c7c6d63a9e5')

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
