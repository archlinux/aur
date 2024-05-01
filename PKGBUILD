# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-pdf'
pkgver='0.31'
pkgrel='2'
pkgdesc="Perl/CPAN Module Text::PDF: Module for manipulating PDF files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Text-PDF'
source=("http://search.cpan.org/CPAN/authors/id/B/BH/BHALLISSY/Text-PDF-$pkgver.tar.gz"
  "bug120334.patch"
  "bug120400.patch"
  "bug123839.patch"
  "bug124350.patch"
  "bug123562.patch"
)
md5sums=('bf63812e65f2e2012e10e422a637760a'
  '7ee42cd37f9adaffc684f69c0744b25c'
  '5ff27bf82b28fd1ad963f1b2c182de62'
  '6d0dfe20fb777fffc05221c9d6689bea'
  '2daa955a773b9d29153c0fe4889ad931'
  'bfbe9480b12f45ada057e13fde28c016'
)
sha512sums=('6413bddaefbb57918763d395b9c751ad630a2095970c2c1febb01235343339fd4eae2820a30b449775d95071cca000a0f11e955fe304c2c56a45e80b384308d5'
  'a809060a6b941e726e1c287c3e722398569e61626e369d8f29ab2813dfb9cd6cba30528f44437970eb7b0cf460b1f8481377fbe19b02df776728b88f4885efd9'
  '6dc510e50e86b2c9f34e2301cd9229bca2161186bdbceec8ee959938b9aa18eb0c182f61ef8bd96d76d4965c04b544b69ec03ac1ff20d397b70482719bbda32d'
  '1f3d4096bd365af677dde25d999f274cace5d260ca2f9c2fbdf3726c10ed908e3ce098ec62aade7af78cb4300ca132c3e5537ea0c7917f4e2bfb2d80c7eb0870'
  '9881616d4ebe47c7849273052896d7bde5d99c9c7a8c2f0761e246215f9e74936cfbf662f3bf2dc2011cbeee0990f8393c90709544cf6370f257a5917fdba945'
  '9fe63e0ce02aaa3cde7c642fc84a9c69c0617f8d86c8f8a59ca078fabe451216c3232630f8d5a9b40724c1d9237c054affa73c2212cd98fc726f9916d984ebf1'
)
_distdir="Text-PDF-$pkgver"

prepare() {
  cd "$srcdir/$_distdir"

  patch --forward --strip=1 --input=$srcdir/bug120334.patch
  patch --forward --strip=1 --input=$srcdir/bug120400.patch
  patch --forward --strip=1 --input=$srcdir/bug123839.patch
  patch --forward --strip=1 --input=$srcdir/bug124350.patch
  patch --forward --strip=1 --input=$srcdir/bug123562.patch
}

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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
