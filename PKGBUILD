# Maintainer: Alad Wenter <alad at archlinux dot org>
# Contributor: Jon Ribeiro <contact@jonathas.com>
pkgname=perl-text-findindent
_dist=Text-FindIndent
pkgver=0.10
pkgrel=2
pkgdesc="'Heuristically determine the indent style'"
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/~smueller/Text-FindIndent"
options=(!emptydirs)
depends=('perl>=5.10.1')
makedepends=('perl')
provides=('perl-text-findindent=0.10')
source=("http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Text-FindIndent-$pkgver.tar.gz")
sha256sums=('492c37e7bb5a4fca665e03728c0affe39c1235f65d85f27136f487af29797a30')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
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

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:


