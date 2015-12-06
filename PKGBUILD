# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit.com>

pkgname=mosh
pkgver=1.2.5
pkgrel=3
pkgdesc='Mobile shell, surviving disconnects with local echo and line editing'
arch=('x86_64' 'i686')
url='http://mosh.mit.edu/'
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'openssh' 'perl' 'perl-io-tty' 'libutempter')
source=("http://$pkgname.mit.edu/$pkgname-$pkgver.tar.gz")
sha256sums=('1af809e5d747c333a852fbf7acdbf4d354dc4bbc2839e3afe5cf798190074be3')
options=('!emptydirs')

build() {
  cd "$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
  install -Dm644 "$pkgname-$pkgver/conf/bash-completion/completions/$pkgname" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}

# vim:set ts=2 sw=2 et:
