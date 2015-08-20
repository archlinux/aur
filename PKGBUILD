# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-time-mock'
pkgver=0.0.2
_pkgver=v${pkgver}
pkgrel=1
pkgdesc='shift and scale time'
_dist='Time-Mock'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl')
checkdepends=()
makedepends=('perl-module-build>=0.26' 'perl-test-simple>=0')
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/E/EW/EWILHELM/${_dist}-${_pkgver}.tar.gz")
sha256sums=('9bd2f7436bd2bdd9b947d70939c62c425801cae3a4321cb864a8a2f4d1f3982f')

build() (
    cd "${srcdir}/${_dist}-${_pkgver}"
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
    perl Build.PL
    ./Build
)

check() (
    cd "${srcdir}/${_dist}-${_pkgver}"
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1
    ./Build test
)

package() (
    cd "${srcdir}/${_dist}-${_pkgver}"
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    ./Build install installdirs='vendor' destdir="$pkgdir"
)
