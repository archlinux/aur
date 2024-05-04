# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-file-xdg
_cpanname=File-XDG
pkgver=1.02
pkgrel=2
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
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $_cpanname-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make DESTDIR="$pkgdir" install

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
