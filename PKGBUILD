# Maintainer : Nicolas Guillaumin <nicolas plus archlinux at guillaumin dot me>
pkgname=perl-file-lockf
pkgver=0.25
pkgrel=1
pkgdesc='Perl module interface to the lockf system call'
_dist=File-Lockf
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('Unknown')
depends=(perl)
makedepends=()
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/P/PH/PHENSON/$_dist-$pkgver.tar.gz")
md5sums=(3c6b8ca40caa1b3975f5b7567d91d6f1)

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
