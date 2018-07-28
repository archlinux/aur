# Maintainer: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-protocol-socketio'
pkgver=0.07
pkgrel=1
pkgdesc='Socket.IO protocol implementation'
_dist='Protocol-SocketIO'
arch=(any)
url="http://search.cpan.org/dist/Protocol-SocketIO/"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-json')
options=(!emptydirs purge)
makedepends=('perl-module-build-tiny>=0.035')
checkdepends=()
provides=("perl-protocol-socketio=${pkgver}")
source=("http://search.cpan.org/CPAN/authors/id/V/VT/VTI/${_dist}-${pkgver}.tar.gz")
sha512sums=('4799d0252f41f6d48bcdb0640da400d16dab24b43b6c285c74933a8b8668efbb08003e6bbc36f8979c4bc357f462310bb6bc8b63dfb1981003dd05a81ad013ed')

sanitize() {
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
}

build() {
  cd "${srcdir}/${_dist}-${pkgver}"
  sanitize
  perl Build.PL --installdirs vendor --destdir "$pkgdir"
  perl Build
}

check() {
  cd "${srcdir}/${_dist}-${pkgver}"
  sanitize
  perl Build test
}

package() {
  cd "${srcdir}/${_dist}-${pkgver}"
  sanitize
  perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
