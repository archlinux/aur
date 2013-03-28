# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit.com>

pkgname=mosh
pkgver=1.2.4
pkgrel=1
pkgdesc='Mobile shell, surviving disconnects with local echo and line editing'
arch=('x86_64' 'i686')
url='http://mosh.mit.edu/'
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'openssh' 'perl' 'perl-io-tty' 'libutempter')
source=("http://$pkgname.mit.edu/$pkgname-$pkgver.tar.gz")
sha256sums=('e74d0d323226046e402dd469a176075fc2013b69b0e67cea49762c957175df46')
optdepends=('ufw-extras')
options=('!emptydirs')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "conf/bash_completion.d/$pkgname" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}

# vim:set ts=2 sw=2 et:
