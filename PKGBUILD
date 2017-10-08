# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname=perl-mp3-m3u-parser
pkgver=2.32
pkgrel=1
pkgdesc="MP3 playlist parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-text-template')
makedepends=()
url='http://search.cpan.org/dist/MP3-M3U-Parser'
source=('http://search.cpan.org/CPAN/authors/id/B/BU/BURAK/MP3-M3U-Parser-2.32.tar.gz'
        'Spec.pm.patch')
md5sums=('57610dc9fe2bc57e709e87f125c7bdfc'
         'c5ada23139ee68d4bb9849aa258b571e')
sha512sums=('629f1cb3d66c1fa0971298be8df1b1f4cd8e435406e666279120fc1c786441c2d80e973d6a8a469e9ce6fe79b4451c4b29530a1345f57ab86cd6554e974219db'
            '8ac97464af66b78adb92664225ec29161c28de7fdbcb1eff3f461b1c6c15f2ba4e8303a7575ef32703399ef15498568c75e0d30fedc8a38a814739eb0d325356')
_distdir="MP3-M3U-Parser-2.32"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    patch -Np1 < Spec.pm.patch
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
