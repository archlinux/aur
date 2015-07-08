# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-alpm
_cpanname=ALPM
pkgver=3.06
pkgrel=1
pkgdesc='ArchLinux Package Manager backend library.'
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('pacman')
url="https://metacpan.org/release/$_cpanname"
source=("https://cpan.metacpan.org/authors/id/A/AP/APG/$_cpanname-$pkgver.tar.gz")
md5sums=('6463afd95e292f3a9040e2c722663f05')

build() (
  cd $_cpanname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
)

check() (
  cd $_cpanname-$pkgver
  make test
)

package() (
  cd $_cpanname-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
)
