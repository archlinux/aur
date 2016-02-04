# Maintainer: Harm Müller <harm[DOT]mueller[AT]gmail[DOT]com>
pkgname='perl-rex'
pkgver='1.3.3'
pkgrel='4'
pkgdesc="(R)?ex Deployment & Configuration Management"
arch=('any')
license=('Apache')
options=('!emptydirs')
depends=('perl-hash-merge' 'perl-net-ssh2' 'perl-libwww' 'perl-io-string' 'perl-json-xs' 'perl-list-allutils' 'perl-sort-naturally' 'perl-term-readkey' 'perl-text-glob' 'perl-xml-simple' 'perl-yaml' 'perl-net-openssh' 'perl-test-useallmodules' 'perl-io-tty' 'perl-net-sftp-foreign' 'perl-test-pod' 'perl-string-escape' 'perl-test-deep' 'perl-devel-caller' 'perl-padwalker')
makedepends=()
url='http://www.rexify.org/'
source=('http://search.cpan.org/CPAN/authors/id/F/FE/FERKI/Rex-1.3.3_01.tar.gz')
md5sums=('879a51c97ae05996360a48a463d0ff0a')
sha512sums=('c62db40b225c1ae79f5e410bae65bb0133cd39228cf5001c02fdcb1446f4f309842805504f7cc2178082bf95cb2466b1be414a16f6020e8c5a4fc1890e016031')
_distdir="Rex-1.3.3_01"

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
