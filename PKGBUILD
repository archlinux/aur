# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-protocol-socketio'
_pkgname='Protocol-SocketIO'
pkgver=0.04
pkgrel=2
pkgdesc='Socket.IO protocol implementation'
arch=(any)
license=('PerlArtistic' 'GPL')
url="http://search.cpan.org/dist/Protocol-SocketIO/"
options=(!emptydirs)

depends=('perl' 'perl-json')
makedepends=('perl')

provides=("protocol-socketio=${pkgver}" "Protocol::SocketIO=${pkgver}" "perl-protocol-socketio=${pkgver}")

source=("http://search.cpan.org/CPAN/authors/id/V/VT/VTI/${_pkgname}-${pkgver}.tar.gz")
md5sums=('430e519b789345a00183b4db18704165')
sha512sums=('b50746c676f93bedc4d7688f07e7c0c66b325741bd1eceb4c6e6c0940213a5ecd7d4eef26eb762d9c48c93dbcef20aaf6d2e24423dcf7927b94b648ad94039b2')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
