# Maintainer: Tyrolyean <tyrolyean@tyrolyean.net>

pkgname='perl-asterisk-ami'
provides=('perl-asterisk-ami')
pkgbase='perl-asterisk-ami'
pkgver='0'
pkgrel='1'
pkgdesc=" a flexible, powerful, andreliable way to interact with Asterisk"
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=('perl-anyevent' 'perl-crypt-ssleay')
makedepends=('git')
url='https://github.com/rrb3942/perl-Asterisk-AMI'
source=("git+https://github.com/rrb3942/perl-Asterisk-AMI.git")
md5sums=('SKIP')
_distdir="perl-Asterisk-AMI"

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
