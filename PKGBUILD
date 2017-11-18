# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Rickard Gustafsson <rickard@allyourbase.se>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Joel Klinghed <the_jk@yahoo.com>
# Contributor: Paweł Tomak <pawel@tomak.eu>

pkgname=pike
pkgver=8.0.498
pkgrel=1
pkgdesc='Dynamic programming language with a syntax similar to Java and C'
arch=('x86_64' 'i686')
url='http://pike.lysator.liu.se'
license=('GPL2' 'LGPL' 'MPL')
depends=('gtksourceview3' 'sane' 'libzip' 'libmariadbclient' 'gtkglarea' 'nettle')
source=("$url/pub/$pkgname/all/$pkgver/Pike-v$pkgver.tar.gz"
        "$pkgname.patch")
sha256sums=('b14ceccb26f37dbd9e078d87648a95f0501f290e89ae9b8197b2376d13eb1f2b'
            '7a5239c3ad078d30c4b6461dbbd4cbf362121fcc4aac8407f5fa3a167c190e3b')

prepare() {
  cd "Pike-v$pkgver"

  patch -p1 -i ../$pkgname.patch
}

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
    --without-machine-code \
    --with-weak-curves"
}

package() {
  cd "Pike-v$pkgver"

  make buildroot="$pkgdir" INSTALLARGS='--traditional' install_nodoc
  install -Dm644 man/pike.1 "$pkgdir/usr/share/man/man1/pike.1"
}
