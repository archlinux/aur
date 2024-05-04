# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-file-xdg
_cpanname=File-XDG
pkgver=1.02
pkgrel=1
pkgdesc="CPAN/File::XDG -- basic implementation of the XDG base directory spec"
arch=('any')
url="https://metacpan.org/module/File::XDG"
license=('GPL')
depends=('perl-file-homedir' 'perl-path-class')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/$_cpanname-$pkgver.tar.gz")
md5sums=('162aafd0414382491f11f9ef6e85aae7')

build() {
  cd $_cpanname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $_cpanname-$pkgver
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
