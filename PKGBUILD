# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-file-xdg
_cpanname=File-XDG
pkgver=0.04
pkgrel=1
pkgdesc="CPAN/File::XDG -- basic implementation of the XDG base directory spec"
arch=('any')
url="https://metacpan.org/module/File::XDG"
license=('GPL')
depends=('perl-file-homedir' 'perl-path-class')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/A/AE/AERDAN/$_cpanname-$pkgver.tar.gz")
md5sums=('f2573705b55220ff7089f2d95795b9bb')

build() {
  cd "$srcdir/$_cpanname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_cpanname-$pkgver"
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
