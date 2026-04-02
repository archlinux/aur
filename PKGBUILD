# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=GSHANK
_dist=HTML-FormHandler
pkgname=perl-${_dist@L}
pkgver=0.40068
pkgrel=1
pkgdesc='HTML forms using Moose'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-aliased'
    'perl-carp'
    'perl-class-load>=0.06'
    'perl-crypt-blowfish'
    'perl-crypt-cbc'
    'perl-data-clone'
    'perl-datetime'
    'perl-datetime-format-strptime'
    'perl-email-valid'
    'perl-file-sharedir'
    'perl-html-parser'
    'perl-html-tree>=3.23'
    'perl-json-maybexs>=1.003003'
    'perl-locale-maketext>=1.09'
    'perl-mime-base64'
    'perl-moose>=2.1403'
    'perl-moosex-getopt>=0.16'
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
    'perl-test-simple'
    'perl-test-warn'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('eb7b78dda3125752cc8bcc0396d3977fbd28da33d2d44c5042ad6d35d6cde827')

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
