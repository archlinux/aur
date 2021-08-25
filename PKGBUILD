# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=perl-hash-flatten
pkgver='1.19'
pkgrel='1'
pkgdesc="Perl module to flatten/unflatten complex data hashes."
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl>=5.6.0')
makedepends=('perl-test-assertions' 'perl-test-pod-coverage')
url='https://metacpan.org/pod/Hash::Flatten'
source=("https://cpan.metacpan.org/authors/id/B/BB/BBC/Hash-Flatten-$pkgver.tar.gz")
sha512sums=('6a950c4e18b58a9eb1e8cbe51cc9ad7d80a01c8456cfc5c10d57c77bcf64f57f6d4a0d4291359185921b9635b31ac66e51ea990c2bcde3c657b24f4246d016b3')
_distdir="Hash-Flatten-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}
