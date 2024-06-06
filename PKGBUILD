# Maintainer: Elias Elwyn <a@jthv.ai>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-proc-pid-file
pkgver=1.29
pkgrel=2
pkgdesc='Manage process id files'
_dist=Proc-PID-File
arch=(any)
url="https://metacpan.org/release/$_dist"
license=(GPL-2.0-only)
depends=(perl)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/D/DM/DMITRI/$_dist-$pkgver.tar.gz")
sha256sums=(3bceda49df182d3d8168b70c2a51b2056f2fd45950a6d0428a9992fd355cd4a4)

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
