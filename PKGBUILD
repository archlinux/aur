# Maintainer: Klaus Tachtler (klaus@tachtler.net>
# Contributor: Matt Day <matt@msday.co.uk>
# Contributor: L. Bradley LaBoon <me@bradleylaboon.com>
# Contributor: Anatol Pomozov <anatol.pomozov+arch@gmail.com>
# Contributor: Firmicus <francois.archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=mod_perl
pkgver=2.0.13
pkgrel=2
pkgdesc='Apache module that embeds the Perl interpreter within the server'
arch=(i686 x86_64 armv6h armv7h)
url='http://perl.apache.org/'
license=(APACHE)
depends=(perl apache db apr-util perl-linux-pid)
options=(!emptydirs)
source=(https://archive.apache.org/dist/perl/mod_perl-$pkgver.tar.gz)
sha256sums=('ade3be31c447b8448869fecdfcace258d6d587b8c6c773c5f22735f70d82d6da')

build() {
  cd mod_perl-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor MP_APXS=/usr/bin/apxs
  make
}

#check() {
#  cd mod_perl-$pkgver
#  # Workaround test bug as per https://rt.cpan.org/Public/Bug/Display.html?id=118919
#  APACHE_TEST_PORT=48251 APACHE_TEST_PRETEND_NO_LWP=1 make test
#}

package() {
  cd mod_perl-$pkgver
  make install DESTDIR="$pkgdir"
}
