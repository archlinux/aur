# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname='perl-data-float'
_dist='Data-Float'
pkgver='0.013'
pkgrel='4'
pkgdesc="Contains the Data::Float module, native floating point numerical data type"
arch=('x86_64' 'armv7h' 'aarch64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-module-build')
url="https://metacpan.org/release/$_dist"
source=("https://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/$_dist-$pkgver.tar.gz")
md5sums=('58356ac67e6693311cc6c77f2022183d')
sha512sums=('7e3be7843df30e581bd8937fde226ac6f24100206a376e1dbed2d4699c95d3f39a25cd1485f5871c46adba88d2fb1899efcd326f908797cdc985ec713cd9a90f')
_distdir="$_dist-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    ./Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    ./Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  ./Build install --installdirs=vendor --destdir="$pkgdir"

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
