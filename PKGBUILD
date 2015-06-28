# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-canary-stability
_realname=Canary-Stability
pkgver=2006
pkgrel=1
pkgdesc="CPAN/Canary-Stability - canary to check perl compatability for schmorp's modules"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent>=5' 'perl-common-sense' 'perl-guard>=0.5')
makedepends=()
url="https://metacpan.org/release/${_realname}"
source=("http://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/${_realname}-${pkgver}.tar.gz")
md5sums=('570ffd5fd8a399b6ba392c8451c8f5ab')

build() {
  cd "$srcdir/$_realname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_realname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
