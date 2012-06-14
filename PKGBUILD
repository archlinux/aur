# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit.com>

pkgname=mosh
pkgver=1.2.2
pkgrel=1
pkgdesc='Mobile shell, surviving disconnects with local echo and line editing'
arch=('x86_64' 'i686')
url="http://mosh.mit.edu/"
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'openssh' 'perl' 'perl-io-tty')
#optdepends=('libutempter: record of session in {u,t}wmp (recompile mosh afterwards)')
source=("https://github.com/downloads/keithw/mosh/$pkgname-$pkgver.tar.gz")
sha1sums=('f0227800298d80e9f1353db3b29a807de833d7d2')
options=('!emptydirs')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -Dm644 "conf/bash_completion.d/$pkgname" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "conf/ufw/applications.d/$pkgname" \
    "$pkgdir/etc/ufw/applications.d/ufw-$pkgname"
}

# vim:set ts=2 sw=2 et:
