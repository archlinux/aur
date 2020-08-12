# Maintainer: Harm Müller <harm[DOT]mueller[AT]gmail[DOT]com>
pkgname='perl-rex'
pkgver='1.12.1'
pkgrel='1'
pkgdesc="(R)?ex, the friendly automation framework"
arch=('any')
license=('Apache')
options=('!emptydirs')
depends=(
  'perl-aws-signature4'
  'perl-data-validate-ip'
  'perl-devel-caller'
  'perl-digest-hmac'
  'perl-file-sharedir-install'
  'perl-hash-merge'
  'perl-http-message'
  'perl-io-string'
  'perl-json-maybexs'
  'perl-list-moreutils'
  'perl-libwww'
  'perl-net-openssh'
  'perl-net-sftp-foreign'
  'perl-scalar-list-utils'
  'perl-sort-naturally'
  'perl-term-readkey'
  'perl-test-deep'
  'perl-test-simple'
  'perl-test-useallmodules'
  'perl-text-glob'
  'perl-uri'
  'perl-xml-simple'
  'perl-yaml')
optdepends=(
  'perl-file-libmagic'
  'perl-string-escape'
  'perl-xml-libxml'
)
makedepends=()
url='https://www.rexify.org/'
source=('https://cpan.metacpan.org/authors/id/F/FE/FERKI/Rex-1.12.1.tar.gz')
md5sums=('18364b57903000bcb2ed7ce4d3d2b889')
sha256sums=('5c4c60a5ed35de6aff9494c5cf3bd760990161b32f77be7247c421bdfd047963')
_distdir="Rex-1.12.1"

build()
(
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  unset PERL5LIB PERL_MM_OPT
  /usr/bin/perl Makefile.PL
  make
)


check()
(
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  make test
)


package()
(
  cd "$srcdir/$_distdir"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
)
