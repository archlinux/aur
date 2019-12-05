# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Mail-Milter-Authentication'
_modnamespace=Mail
pkgname=perl-mail-milter-authentication
pkgver=2.20191206
pkgrel=1
pkgdesc="A Perl Mail Authentication Milter"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-json' 'perl-list-moreutils' 'perl-clone' 'perl-email-date-format' 'perl-email-simple' 'perl-log-dispatchouli' 'perl-mail-authenticationresults' 'perl-mail-dkim' 'perl-mail-dmarc' 'perl-mail-spf' 'perl-net-dns' 'perl-net-ip' 'perl-net-server' 'perl-proc-processtable' 'perl-test-file-contents' 'perl-toml' 'perl-prometheus-tiny-shared')
makedepends=('perl-file-sharedir-install' 'perl-crypt-openssl-rsa' 'perl-test-exception')
backup=('etc/authentication_milter.json')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz"
        'authentication_milter.service')
sha256sums=('e033972c8d13f0decba154f831ebb49d74309a55537b45fd8d72967c727aae49'
            '8715d45d62859fb3838d0fd31878d59b47da2cb62d55675f828f8b812845526d')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  install -Dm644 "$srcdir/authentication_milter.service" "$pkgdir/usr/lib/systemd/system/authentication_milter.service"
}

# vim:set ts=2 sw=2 et:
