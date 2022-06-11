# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Thomas Weißschuh <thomas_weissschuh@lavabit.com>

pkgname=mosh
pkgver=1.3.2
pkgrel=18
pkgdesc='Mobile shell, surviving disconnects with local echo and line editing'
arch=(x86_64)
url='https://mosh.org/'
license=(GPL3)
depends=(libutempter openssh openssl perl-io-tty protobuf)
makedepends=(git)
options=(!emptydirs)
source=("git+https://github.com/mobile-shell/mosh#tag=$pkgname-$pkgver")
sha512sums=('SKIP')

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --enable-ufw --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
  install -Dm644 "$pkgname/conf/bash-completion/completions/$pkgname" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}

# getver: raw.githubusercontent.com/mobile-shell/mosh/master/ChangeLog
# vim: ts=2 sw=2 et:
