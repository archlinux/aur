# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit.com>

pkgname=mosh
pkgver=1.2.1
pkgrel=2
pkgdesc='Mobile shell, surviving disconnects with local echo and line editing'
arch=('x86_64' 'i686')
url="http://mosh.mit.edu/"
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'openssh' 'perl' 'perl-io-tty')
#optdepends=('libutempter: record of session in {u,t}wmp (recompile mosh afterwards)')
source=("https://github.com/downloads/keithw/mosh/mosh-1.2.1.tar.gz")
sha1sums=('73b95b11699d8321c749a9590e0c12caeed52405')
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
    "$pkgdir/etc/bash_completion.d/$pkgname"
  install -Dm644 "conf/ufw/applications.d/$pkgname" \
    "$pkgdir/etc/ufw/applications.d/ufw-$pkgname"
}

# vim:set ts=2 sw=2 et:
