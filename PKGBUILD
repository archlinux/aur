# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

_cpanname=Tk-GBARR
pkgname=perl-tk-gbarr
pkgver=2.08
pkgrel=7.2
pkgdesc='Perl/CPAN Module Tk::TFrame,Cloth,NumEntry,NumEntryPlain,FireButton'
arch=('any')
url="http://metacpan.org/release/${_cpanname}"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/S/SR/SREZIC/${_cpanname}-$pkgver.tar.gz")
provides=('perl-tk-tframe')
conflicts=('perl-tk-tframe')
depends=('perl-tk')
md5sums=('8791dc6ddba154ccb9b6a54e8ad11351')

prepare() {
    cd ${_cpanname}-$pkgver
    sed -i -e '/PM =>/d' Makefile.PL
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd ${_cpanname}-$pkgver
    /usr/bin/perl Makefile.PL
    make
  )
}

package() {
  cd ${_cpanname}-$pkgver
  make install DESTDIR="$pkgdir/"

  #remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
