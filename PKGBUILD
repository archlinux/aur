# maintainer: xerus <27jf at pm dot me>
_author="Johan Vromans"
_pkgname="File-LoadLines"
pkgname=perl-file-loadlines
pkgver=1.021
pkgrel=2
pkgdesc="load the contents of a text file into an array of lines"
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=(perl-test-exception)
url="https://metacpan.org/release/${_pkgname}"
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('b7b6f3676df537422e038377ea76f0b7c42270d543975903cdfbcc9e1fe6701b3a132432800d242a5127ff3899de02c0bad40eb25cb5142a468679f92719d6c7')
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
