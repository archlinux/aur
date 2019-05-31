# Maintainer: KingofToasters <dev at sgregoratto dot me>
_modnamespace=App
pkgname=nauniq
pkgver=0.10
pkgrel=1
pkgdesc="non-adjacent uniq"
license=('GPL' 'PerlArtistic')
arch=('any')
depends=('perl>=5.10.0')
checkdepends=('perl-file-slurper' 'perl-file-chdir' 'perl-string-shellquote' 'perl-tie-cache')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_modnamespace-$pkgname-$pkgver.tar.gz")
sha256sums=('8c37c9baf352bf21b876c1fef76b7225e493149e15e1d74defa94047d5a0e934')

build() {
  cd "$srcdir/$_modnamespace-$pkgname-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}


check() {
  cd "$srcdir/$_modnamespace-$pkgname-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_modnamespace-$pkgname-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
