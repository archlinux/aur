# Maintainer: Samantha Poot <samantha.poot@protonmail.com>

pkgname='perl-file-kdbx'
pkgver='0.906'
pkgrel='1'
pkgdesc="Encrypted database to store secret text and files"
_dist=File-KDBX
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-boolean' 'perl-crypt-argon2' 'perl-cryptx' 'perl-crypt-rijndael>=1.0' 'perl-devel-globaldestruction' 'perl-iterator-simple' 'perl-math-bigint' 'perl-namespace-clean' 'perl-ref-util' 'perl-scalar-list-utils' 'perl-scope-guard' 'perl-xml-libxml')
makedepends=('perl-test-deep' 'perl-test-fatal' 'perl-test-warnings')
url='https://metacpan.org/release/File-KDBX'
source=('https://cpan.metacpan.org/authors/id/C/CC/CCM/File-KDBX-0.906.tar.gz')
md5sums=('d6fad88f528b7ddfc409e9c7c08b39de')
sha512sums=('09936f3ebfa6a0f7b514033065e8ddeb4aa158afec14f36a0c71f7e7db4ae79ac948e4d4962577bddda17357287ca15cbc6668517cdd3ca8b29f637c192b3c8b')

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

