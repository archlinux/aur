# Maintainer: Harm Müller <harm[DOT]mueller[AT]gmail[DOT]com>
pkgname='perl-rex'
pkgver='1.3.3'
pkgrel='5'
pkgdesc="(R)?ex Deployment & Configuration Management"
arch=('any')
license=('Apache')
options=('!emptydirs')
depends=('perl-hash-merge' 'perl-net-ssh2' 'perl-libwww' 'perl-io-string' 'perl-json-xs' 'perl-list-allutils' 'perl-sort-naturally' 'perl-term-readkey' 'perl-text-glob' 'perl-xml-simple' 'perl-yaml' 'perl-net-openssh' 'perl-test-useallmodules' 'perl-io-tty' 'perl-net-sftp-foreign' 'perl-test-pod' 'perl-string-escape' 'perl-test-deep' 'perl-devel-caller' 'perl-padwalker')
makedepends=()
url='http://www.rexify.org/'
source=('http://search.cpan.org/CPAN/authors/id/F/FE/FERKI/Rex-1.3.3_02.tar.gz')
md5sums=('896cb20e190be99170c704997b2d2098')
sha512sums=('0e1e88627128bcb07e5fb2e8fb1b64e0cb412372cc44f7d1e2f4a6eb48229385f9a83c3b472e7176895eaa7523efe3000f510283ca98cc8f64967a33f9672200')
_distdir="Rex-1.3.3_02"

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
