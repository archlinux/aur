# Maintainer: Harm Müller <harm[DOT]mueller[AT]gmail[DOT]com>
pkgname='perl-rex'
pkgver='1.9.0'
pkgrel='1'
pkgdesc="(R)?ex Deployment & Configuration Management"
arch=('any')
license=('Apache')
options=('!emptydirs')
depends=('perl-hash-merge' 'perl-net-ssh2' 'perl-libwww' 'perl-io-string' 'perl-json-xs' 'perl-list-allutils' 'perl-sort-naturally' 'perl-term-readkey' 'perl-text-glob' 'perl-xml-simple' 'perl-yaml' 'perl-net-openssh' 'perl-test-useallmodules' 'perl-io-tty' 'perl-net-sftp-foreign' 'perl-test-pod' 'perl-string-escape' 'perl-test-deep' 'perl-devel-caller' 'perl-padwalker' 'perl-json-maybexs' 'perl-data-validate-ip')
makedepends=()
url='http://www.rexify.org/'
source=('https://cpan.metacpan.org/authors/id/F/FE/FERKI/Rex-1.9.0.tar.gz')
md5sums=('d9b85435fa9877b1d21916cab2d60ace')
sha256sums=('8890d3ab6eabe15cd81640738b59fe696be8abd2a1bc71b43ce1ef88bdfafd30')
_distdir="Rex-1.9.0"

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
