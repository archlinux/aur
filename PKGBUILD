# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-file-xdg
_cpanname=File-XDG
pkgver=0.08
pkgrel=1
pkgdesc="CPAN/File::XDG -- basic implementation of the XDG base directory spec"
arch=('any')
url="https://metacpan.org/module/File::XDG"
license=('GPL')
depends=('perl-file-homedir' 'perl-path-class')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/$_cpanname-$pkgver.tar.gz")
md5sums=('cb8b104218878a86fa1a51b4cc635f2d')

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
