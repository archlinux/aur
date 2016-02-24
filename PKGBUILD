# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Rickard Gustafsson <rickard@allyourbase.se>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Joel Klinghed <the_jk@yahoo.com>

pkgname=pike
pkgver=8.0.164
pkgrel=1
pkgdesc='Dynamic programming language with a syntax similar to Java and C'
arch=('x86_64' 'i686')
url='http://pike.lysator.liu.se/'
license=('GPL2' 'LGPL' 'MPL')
depends=('gtksourceview2' 'sane' 'libzip' 'libmysqlclient' 'gtkglarea' 'nettle')
makdepends=('nettle')
source=("http://pike.lysator.liu.se/pub/pike/latest-stable/Pike-v$pkgver.tar.gz")
sha256sums=('fb1fe218d330258ea6930c2060e304999c54c30b7cb30c9f9d5eb4d974c3c258')

build() {
  cd "Pike-v$pkgver"

  # Thank you for the flags Gentoo <3
  # http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-lang/pike/pike-7.8.352-r2.ebuild?view=markup
  make CONFIGUREARGS=" \
    --prefix=/usr \
    --libdir=/usr/lib \
    --disable-make_conf \
    --disable-noopty-retry \
    --without-cdebug \
    --without-bundles \
    --without-copt \
    --without-libpdf \
    --without-ssleay \
    --with-crypt \
    --with-gif \
    --with-gmp \
    --with-bignums \
    --without-machine-code"
}

package() {
  cd "Pike-v$pkgver"

  make buildroot="$pkgdir" INSTALLARGS='--traditional' install_nodoc
  rm -rf "$pkgdir/usr/"{doc,man}
  install -Dm644 man/pike.1 "$pkgdir/usr/share/man/man1/pike.1"
}

# vim:set ts=2 sw=2 et:
