# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit.com>

pkgname=mosh
pkgver=1.3.0
pkgrel=4
pkgdesc='Mobile shell, surviving disconnects with local echo and line editing'
arch=('x86_64' 'i686')
url='https://mosh.org/'
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'openssh' 'perl' 'perl-io-tty' 'libutempter')
source=("https://mosh.org/$pkgname-$pkgver.tar.gz")
sha256sums=('320e12f461e55d71566597976bd9440ba6c5265fa68fbf614c6f1c8401f93376')
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
# vim: ts=2 sw=2 et:
