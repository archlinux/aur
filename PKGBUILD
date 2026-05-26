# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Kars Wang <jaklsy AT gmail.com>

_author=ATHOMASON
_dist=CGI-Deurl-XS
pkgname=perl-${_dist@L}
pkgver=0.08
pkgrel=2
pkgdesc='Fast decoder for URL parameter strings'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('Apache-2.0 AND (Artistic-1.0-Perl OR GPL-1.0-or-later)')
depends=('perl')
makedepends=('perl-extutils-makemaker')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('9a3c325582eab31e0ed431edd095f6f008fd734ee313bc65f582a1f3378b52a1')

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
