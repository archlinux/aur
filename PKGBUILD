# Maintainer : Nicolas Guillaumin <nicolas plus archlinux at guillaumin dot me>
pkgname=perl-digest-bcrypt
pkgver=1.209
pkgrel=1
pkgdesc='Perl interface to the bcrypt digest algorithm'
_dist=Digest-Bcrypt
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=(perl)
makedepends=()
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/C/CA/CAPOEIRAB/$_dist-$pkgver.tar.gz")
md5sums=(b03529a1cfc31c04a66d7736b4ca4003)

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
}
