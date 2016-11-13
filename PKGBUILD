# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
# Contributor: Anatol Pomozov <anatol.pomozov+arch@gmail.com>
# Contributor: Firmicus <francois.archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=mod_perl
pkgver=2.0.10
pkgrel=1
pkgdesc='Apache module that embeds the Perl interpreter within the server'
arch=(i686 x86_64 armv6h)
url='http://perl.apache.org/'
license=(APACHE)
depends=(perl apache db apr-util perl-linux-pid)
options=(!emptydirs)
source=(http://apache.org/dist/perl/mod_perl-$pkgver.tar.gz{,.asc})
validpgpkeys=(2026E6A4A6A4483E61BA6F3FAB34BA0040E92ECE)
sha256sums=('d1cf83ed4ea3a9dfceaa6d9662ff645177090749881093051020bf42f9872b64'
            'SKIP')

build() {
  cd mod_perl-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor MP_APXS=/usr/bin/apxs
  make
}

check() {
  cd mod_perl-$pkgver
  # tests are very flaky
  # make test
}

package() {
  cd mod_perl-$pkgver
  make install DESTDIR="$pkgdir"
}
