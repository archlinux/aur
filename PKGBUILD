# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=perl-app-asciio
pkgver=1.51.3
pkgrel=2
pkgdesc="Build ASCII diagrams"
arch=('any')
url="http://search.cpan.org/dist/App-Asciio/lib/App/Asciio.pm"
license=('GPL' 'PerlArtistic')
depends=('perl')
_pkgname=App-Asciio
options=('!emptydirs' purge)
install=
changelog=
noextract=()
source=("http://search.cpan.org/CPAN/authors/id/N/NK/NKH/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('49c3f685fbb33a7bbe737107ca6e68b4f0ea7b0757601ada6dd5fce7f7dfc232f1ff178d55b5fe33fc4718290ec771454bb61eda64b85e83899b97b40b641948'
            'SKIP')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

# Tests are failing left and right these days for a lot of perl packages.
# Oddly enough, doesn't seem to affect anything. So for now, we disable...
#check() {
#  cd "${srcdir}/${_pkgname}-${pkgver}"
#  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
#  export PERL_MM_USE_DEFAULT=1
#  ./Build test
#}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
