# Contributor: Manifest0
pkgname=perl-extutils-install
pkgver=2.18
pkgrel=1
pkgdesc='ExtUtils::Install - install files from here to there'
_dist='ExtUtils-Install'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/B/BI/BINGOS/$_dist-$pkgver.tar.gz")
md5sums=('9e7e733487358ee9e3888b1b69fd7f23')
sha512sums=('3af42cd2b5f7b978552b03348184e734014a1e950fd48496089dd5ddfb2cab7d0193751bd6d8e1265f0cbd5a85dbd9c248ab38bb0ea41eaa4f1e70d37eaf2a1c')


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
