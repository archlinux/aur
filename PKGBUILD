pkgname=perl-http-cookiejar
pkgver=0.006
pkgrel=1
pkgdesc='A minimalist HTTP user agent cookie jar'
_dist='HTTP-CookieJar'
arch=('any')
url="http://search.cpan.org/dist/HTTP-CookieJar"
license=('Apache 2.0')
depends=('perl' 'perl-http-date' 'perl-time-mock')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/${_dist}-${pkgver}.tar.gz")
sha1sums=('46aa70384ab71292dec7e783518fb6d5474d74b0')

build() (
    cd "${srcdir}/${_dist}-${pkgver}"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
    perl Makefile.PL INSTALLDIRS=vendor
    make
)

check() (
    cd "${srcdir}/${_dist}-${pkgver}"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1
    make test
)

package() (
    cd "${srcdir}/${_dist}-${pkgver}"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
