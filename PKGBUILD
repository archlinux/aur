# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=perl-paper-specs
pkgver=0.10
pkgrel=2
pkgdesc='This packages the perl-paper-specs distribution, containing the Paper::Specs module!'
_dist=Paper-Specs
arch=('any')
url="http://search.cpan.org/dist/PDF-Labels"
license=('GPL' 'PerlArtistic')
depends=()
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/J/JO/JONALLEN/$_dist-$pkgver.tar.gz")

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
	sed -i -e 's:usr/local:usr:g' Makefile
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
md5sums=('9015563658a30f9fcfd98f23bb88651b')
sha256sums=('4bba86a1021122d727a746cd98d8e8123b29a14029330cc68c989df095e55b37')
