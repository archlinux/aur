# Maintainer: Flammkuchen <aur at bbirkner dot de>
# Contributor: xerus <27jf at pm dot me>
_author="Johan Vromans"
_pkgname="File-LoadLines"
pkgname=perl-file-loadlines
pkgver=1.047
pkgrel=2
pkgdesc="load the contents of a text file into an array of lines"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=(perl-test-exception)
url="https://metacpan.org/release/${_pkgname}"
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('f00feac7faabcd1f220565cc318a30de5cc16187457cb2158629bbe2b7cb478694beb0da6f7041fbb8c4c088230bab70162aada4497abf6816c5f8e715af2c10')
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
