# Maintainer: Matt Day <matt@msday.co.uk>
# Contributor: L. Bradley LaBoon <me@bradleylaboon.com>
# Contributor: Anatol Pomozov <anatol.pomozov+arch@gmail.com>
# Contributor: Firmicus <francois.archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=mod_perl
pkgver=2.0.11
pkgrel=2
pkgdesc='Apache module that embeds the Perl interpreter within the server'
arch=(i686 x86_64 armv6h armv7h)
url='http://perl.apache.org/'
license=(APACHE)
depends=(perl apache db apr-util perl-linux-pid)
options=(!emptydirs)
source=(http://apache.org/dist/perl/mod_perl-$pkgver.tar.gz{,.asc})
validpgpkeys=(2026E6A4A6A4483E61BA6F3FAB34BA0040E92ECE)
sha256sums=('ca2a9e18cdf90f9c6023e786369d5ba75e8dac292ebfea9900c29bf42dc16f74'
            'SKIP')

build() {
  cd mod_perl-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor MP_APXS=/usr/bin/apxs
  make
}

check() {
  cd mod_perl-$pkgver
  # Workaround test bug as per https://rt.cpan.org/Public/Bug/Display.html?id=118919
  APACHE_TEST_PRETEND_NO_LWP=1 make test
}

package() {
  cd mod_perl-$pkgver
  make install DESTDIR="$pkgdir"
}
