# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-file-tempdir'
pkgver='0.02'
pkgrel="2"
pkgdesc="Extensible and flexible object <-> relational mapper."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/File-Tempdir'
source=('http://search.cpan.org/CPAN/authors/id/N/NA/NANARDON/File-Tempdir-0.02.tar.gz')
md5sums=('51f609343908803bbc78774ceb81c431')
sha512sums=('8af7dff03dfa3575ade1c8178159901350fe322b6b9f23ef275e292b5856104ff13bb48222c9f42d5087c54b4fb8e5e87513c2946b682a1b047623042f6b34e4')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/File-Tempdir-${pkgver}"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/File-Tempdir-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "${srcdir}/File-Tempdir-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
