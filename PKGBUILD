# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit.com>

pkgname=mosh
pkgver=1.2.6
pkgrel=2
pkgdesc='Mobile shell, surviving disconnects with local echo and line editing'
arch=('x86_64' 'i686')
url='http://mosh.mit.edu/'
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'openssh' 'perl' 'perl-io-tty' 'libutempter')
source=("http://$pkgname.mit.edu/$pkgname-$pkgver.tar.gz")
sha256sums=('7e82b7fbfcc698c70f5843bb960dadb8e7bd7ac1d4d2151c9d979372ea850e85')
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

# getver: raw.githubusercontent.com/mobile-shell/mosh/master/ChangeLog
# vim:set ts=2 sw=2 et:
