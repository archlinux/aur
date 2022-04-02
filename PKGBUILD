# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Ryan Gonzalez <rymg19@gmail.com>
# Contributor: Tom Zander
# Contributor: Christoph Vigano <mail@cvigano.de>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=ikiwiki
pkgver=3.20200202.3
pkgrel=1
pkgdesc='Wiki compiler'
arch=(any)
license=('GPL')
url='https://ikiwiki.info'
depends=(perl-yaml perl-text-markdown perl-cgi-session perl-cgi-formbuilder perl-timedate perl-html-parser perl-html-scrubber perl-mail-sendmail perl-time-duration perl-uri perl-html-template perl-locale-gettext perl-rpc-xml perl-yaml-libyaml)
source=("http://deb.debian.org/debian/pool/main/i/${pkgname}/${pkgname}_${pkgver}.orig.tar.xz")
backup=('etc/ikiwiki/wikilist')
sha256sums=('594f13bcee8959356376a42eed6c5a8e295d325724b1c09f9395404e3262796a')

build() {
  cd "$pkgname-$pkgver"

  # Install module into the vendor directories
  sed -i -e 's/sbin/bin/g' Makefile.PL

  perl Makefile.PL PREFIX="/usr" INSTALL_BASE= INSTALLDIRS=vendor
  make PREFIX="/usr"
}

package() {
  cd "$pkgname-$pkgver"

  make install DESTDIR="$pkgdir"

  # otherwise perl breaks
  find "$pkgdir" -name '.packlist' -or -name '*.pod' -exec rm '{}' +
}
