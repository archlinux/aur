# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-log-tree
_cpanname=Log-Tree
pkgver=0.18
pkgrel=1
pkgdesc="Perl/CPAN Module Log::Tree - lightweight but highly configuration logging class"
arch=(any)
url="https://metacpan.org/release/$_cpanname"
license=(PerlArtistic)
options=('!emptydirs')
depends=(perl-data-tree perl-io-interactive perl-log-dispatch perl-moose perl-namespace-autoclean perl-file-blarf)
source=("http://cpan.metacpan.org/authors/id/T/TE/TEX/$_cpanname-$pkgver.tar.gz")
md5sums=('0ebf6f99534e1fcad1b67b9dcc2df0df')

prepare() {
  cd $_cpanname-$pkgver
  for f in Makefile.PL META.json META.yml ; do
    sed -i -e 's,010_000,010000,' $f
  done
}

build() {
  cd $_cpanname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $_cpanname-$pkgver
  make install DESTDIR="$pkgdir/"
  find "$pkgdir" \( -name perllocal.pod -o -name .packlist \) -delete
}
