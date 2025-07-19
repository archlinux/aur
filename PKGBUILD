# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-html-treebuilder-xpath'
_distdir="HTML-TreeBuilder-XPath-0.14"
pkgver='0.14'
pkgrel='6'
pkgdesc="add XPath support to HTML::TreeBuilder"
arch=('any')
license=('Artistic-1.0-Perl')
options=('!emptydirs')
depends=('perl-html-tree>=0' 'perl-xml-xpathengine>=0.12')
makedepends=()
checkdepends=('perl-test-pod'
              'perl-test-pod-coverage')
url='https://metacpan.org/release/HTML-TreeBuilder-XPath'
source=("${_distdir}.tar.gz::https://github.com/mirod/HTML--TreeBuilder--XPath/archive/master.tar.gz"
        "script-tag-text-contents.patch::https://github.com/mirod/HTML--TreeBuilder--XPath/pull/3.patch")
sha512sums=('3a42b601cab88728859d80798a7dfff2e7ec1f5cd955b184942845fd33083d5c3397c0509b3c37b0da43f96783397069f45503f9303fe15e0e773c29ef92c434'
            '03ab8aa01f2e981013fd2afa13c6a5dc5cabe4f07a9f46f788221a5357a1c4fadf9ff97bac61ac6d503efa34408900c345781cb6bf93424ac889b29a7a5e9dd2')

prepare() {
  mv "${srcdir}/HTML--TreeBuilder--XPath-master" "${srcdir}/${_distdir}"
  cd "$srcdir/$_distdir"

  # Apply fix for omitted text contents of a script tag
  # Reference: https://rt.cpan.org/Public/Bug/Display.html?id=90164
  # Source: https://github.com/mirod/HTML--TreeBuilder--XPath/pull/3 
  patch -Np1 -i ../script-tag-text-contents.patch
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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
