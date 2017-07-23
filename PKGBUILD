# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit.com>

pkgname=mosh
pkgver=1.3.2
pkgrel=1
pkgdesc='Mobile shell, surviving disconnects with local echo and line editing'
arch=('x86_64' 'i686')
url='https://mosh.org/'
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'openssh' 'perl-io-tty' 'libutempter')
makedepends=('git')
options=('!emptydirs')
source=("git+https://github.com/mobile-shell/mosh#tag=$pkgname-$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname" DESTDIR="$pkgdir" install

  install -Dm644 "$pkgname/conf/bash-completion/completions/$pkgname" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}

# getver: raw.githubusercontent.com/mobile-shell/mosh/master/ChangeLog
# vim: ts=2 sw=2 et:
