# Maintainer: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-protocol-socketio'
pkgver=0.06
pkgrel=1
pkgdesc='Socket.IO protocol implementation'
_dist='Protocol-SocketIO'
arch=(any)
url="http://search.cpan.org/dist/Protocol-SocketIO/"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-json')
options=(!emptydirs purge)
makedepends=('perl-module-build>=0.38')
checkdepends=()
provides=("Protocol::SocketIO=${pkgver}" "perl-protocol-socketio=${pkgver}")
source=("http://search.cpan.org/CPAN/authors/id/V/VT/VTI/${_dist}-${pkgver}.tar.gz")
sha512sums=('8e144981b7ed7f9afacb31a2311a20afaab06ad1e53a099d23e27e861751e1c9389f5e6fb84b0b9bcd653b28e937ea7dfb11c88fe055840836a8a34f3a688942')

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
