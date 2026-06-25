# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Moritz Bunkus <moritz@bunkus.org>

_author=HAARG
_dist=Config-Any
pkgname=perl-${_dist@L}
pkgver=0.33
pkgrel=4
pkgdesc='Load configuration from different file formats, transparently'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-module-pluggable>=3.6'
)
checkdepends=('perl-test-simple')
optdepends=(
    'perl-config-general>=2.48'
    'perl-config-tiny'
    'perl-cpanel-json-xs'
    'perl-xml-namespacesupport'
    'perl-xml-simple'
    'perl-yaml-libyaml'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('c0668eb5f2cd355bf20557f04dc18a25474b7a0bcfa79562e3165d9a3c789333')

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
