# Maintainer:
pkgname='perl-rex'
pkgver='1.14.3'
pkgrel='1'
pkgdesc="(R)?ex, the friendly automation framework"
arch=('any')
license=('Apache-2.0')
options=('!emptydirs')
depends=(
  #'perl-aws-signature4' # doesn't build, no time to check what is wrong atm.
  'perl-data-validate-ip'
  'perl-devel-caller'
  'perl-digest-hmac'
  'perl-file-sharedir-install'
  'perl-hash-merge'
  'perl-http-message'
  'perl-io-pty-easy'
  'perl-io-string'
  'perl-json-maybexs'
  'perl-list-moreutils'
  'perl-libwww'
  'perl-net-openssh'
  'perl-net-sftp-foreign'
  'perl-net-ssh2'
  'perl-scalar-list-utils'
  'perl-sort-naturally'
  'perl-sub-override'
  'perl-term-readkey'
  'perl-test-deep'
  'perl-test-exception'
  'perl-test-output'
  'perl-test-simple'
  'perl-test-useallmodules'
  'perl-test-warnings'
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
source=('https://cpan.metacpan.org/authors/id/F/FE/FERKI/Rex-1.14.3.tar.gz')
md5sums=('3e07630f51108e93d8866e4f3501fb4e')
sha256sums=('027d3042ef940b67590e5989e96f22ae1e67ba744895c5dd3db569c05137025c')
_distdir="Rex-1.14.3"

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
