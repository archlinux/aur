# Maintainer: Flammkuchen <aur at bbirkner dot de>
# Contributor: xerus <27jf at pm dot me>
_author="Johan Vromans"
_pkgname="File-LoadLines"
pkgname=perl-file-loadlines
pkgver=1.046
pkgrel=2
pkgdesc="load the contents of a text file into an array of lines"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=(perl-test-exception)
url="https://metacpan.org/release/${_pkgname}"
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('3fc99dabdba3eb92103afb4b5ede28c5a09d063d1bb435e96061b027704adc756bad7afb1b234b850d9fc46ba76036d7e64561075cfbd9469921f570c290bfe9')
_distdir="${_pkgname}-${pkgver}"

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
