# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Laël Guillemenot <zeppelinlg@gmail.com>

_author=RJBS
_dist=Cache-Cache
pkgname=perl-${_dist@L}
pkgver=1.08
pkgrel=2
pkgdesc='extends Cache::SizeAwareMemoryCache'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-digest-sha1>=2.02'
    'perl-error>=0.15'
    'perl-ipc-sharelite>=0.09'
    'perl-pathtools>=0.82'
    'perl-storable>=1.014'
)
makedepends=('perl-extutils-makemaker')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('d2c7fd5dba5dd010b7d8923516890bb6ccf6b5f188ccb69f35cb0fd6c031d1e8')

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
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
