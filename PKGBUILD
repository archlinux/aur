# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Mail-Milter-Authentication'
_modnamespace=Mail
pkgname=perl-mail-milter-authentication
pkgver=3.20220131
pkgrel=2
pkgdesc="A Perl Mail Authentication Milter"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-app-cmd' 'perl-clone' 'perl-date-manip' 'perl-email-date-format' 'perl-email-sender' 'perl-email-simple' 'perl-import-into' 'perl-json' 'perl-list-moreutils' 'perl-lock-file' 'perl-log-dispatchouli' 'perl-mail-authenticationresults' 'perl-mail-bimi' 'perl-mail-datafeed-abusix' 'perl-mail-dkim' 'perl-mail-dmarc' 'perl-mail-spf' 'perl-net-dns' 'perl-net-ip' 'perl-net-server' 'perl-proc-processtable' 'perl-prometheus-tiny-shared>=0.011' 'perl-super' 'perl-test-file-contents' 'perl-test-perl-critic' 'perl-text-table' 'perl-toml')
makedepends=('perl-crypt-openssl-rsa' 'perl-file-sharedir-install' 'perl-test-exception')
checkdepends=('perl-eval-closure' 'perl-namespace-autoclean' 'perl-net-dns-resolver-mock' 'perl-params-validationcompiler' 'perl-specio')
replaces=('perl-mail-milter-authentication-handler-arc')
conflicts=('perl-mail-milter-authentication-handler-arc')
backup=('etc/authentication_milter.json')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz"
        'authentication_milter.service')
sha256sums=('37a6234c28cc547d62e5038e55e75b9892a48f0f876adf94def7b8221a0dff37'
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
