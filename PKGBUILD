# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Rickard Gustafsson <rickard@allyourbase.se>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Alexej Magura <agm2819*gmail*>

pkgname=pike
pkgver=7.8.866
pkgrel=1
pkgdesc='Dynamic programming language with a syntax similar to Java and C'
arch=('x86_64' 'i686')
url='http://pike.lysator.liu.se/'
license=('GPL2' 'LGPL' 'MPL')
depends=('gtksourceview2' 'sane' 'libzip' 'libmysqlclient' 'gtkglarea' 'nettle')
makdepends=('nettle')
source=("http://${pkgname}.ida.liu.se/pub/$pkgname/latest-stable/Pike-v${pkgver}.tar.gz")
sha256sums=('0b12e1a99bd8bdd9c8a2daa46e623ac718bc0737290236a0c8474091359b594e')

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
  gzip man/pike.1
}

package() {
  cd "Pike-v$pkgver"

  make buildroot="$pkgdir" INSTALLARGS='--traditional' install_nodoc
  rm -rf "$pkgdir/usr/"{doc,man}
  install -Dm644 man/pike.1.gz "$pkgdir/usr/share/man/man1/pike.1.gz"
}

# vim:set ts=2 sw=2 et:
