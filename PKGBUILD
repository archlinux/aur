# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-coro.any_perl_version
_pkgname=perl-coro
_realname=Coro
pkgver=6.57
pkgrel=1
pkgdesc="CPAN/Coro - the only real threads in perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
depends=('perl' 'perl-anyevent>=5' 'perl-common-sense' 'perl-guard>=0.5')
makedepends=('perl-canary-stability')
url="https://metacpan.org/release/${_realname}"
source=("http://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/${_realname}-${pkgver}.tar.gz")
md5sums=('fa5970a2a2f3df9d68d4369c7dde1a55')

build() {
  cd $_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make PERL_MM_USE_DEFAULT=1
}

check() {
  cd $_realname-$pkgver
  make PERL_MM_USE_DEFAULT=1 test
}

package() {
  cd $_realname-$pkgver
  make PERL_MM_USE_DEFAULT=1 DESTDIR="$pkgdir" install
  find "$pkgdir" \( -name '.packlist' -o -name '*.pod' \) -delete
}
