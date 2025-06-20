# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-coro
_realname=Coro
pkgver=6.57
pkgrel=2
pkgdesc="CPAN/Coro - the only real threads in perl"
arch=('x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-anyevent>=5' 'perl-common-sense' 'perl-guard>=0.5')
makedepends=('perl-canary-stability')
url="https://metacpan.org/release/${_realname}"
source=("http://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/${_realname}-${pkgver}.tar.gz"
        fix-nvtime-call.patch)
sha256sums=('1928e48033540e11ebf5506986dd101af78d2421d210f96599223b15d51714c6'
            '5fc0706eeee0d136910048b4a18a7fa47db88e30301f785977282f35f95885ec')

build() {
  cd $_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make PERL_MM_USE_DEFAULT=1
}

check() {
  cd $_realname-$pkgver
  make PERL_MM_USE_DEFAULT=1 test
}

prepare() {
  cd $_realname-$pkgver
  patch -p1 -i "${srcdir}/fix-nvtime-call.patch"
}

package() {
  cd $_realname-$pkgver
  make PERL_MM_USE_DEFAULT=1 DESTDIR="$pkgdir" install
  find "$pkgdir" \( -name '.packlist' -o -name '*.pod' \) -delete
}

# vim:set ts=2 sw=2 et:
