# Contributor: Alexander Pohl <alex at ahpohl dot com>
pkgname=perl-test-device-serialport
pkgver=0.05
pkgrel=1
pkgdesc='Serial port mock object to be used for testing, containing the Test::Device::SerialPort module'
_dist=Test-Device-SerialPort
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/C/CO/COSIMO/$_dist-$pkgver.tar.gz")
md5sums=('0392cae3d9607e9955ec5a55f6862521')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

