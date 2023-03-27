# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=mstpd
pkgver=0.1.0
pkgrel=1
pkgdesc="User-space RSTP and MSTP daemon"
url="https://github.com/mstpd/mstpd"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'mstpd.service')
sha256sums=('03d1ff4ca189d54322562cb2891888768af719d2c73ceafa5f1ca96133dffeb2'
            '36c03f67ca55efc2822e2bec04d62c9f43417772b7a10effcf584664ff78227b')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --with-bashcompletiondir=/usr/share/bash-completion/completions
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
  install -Dvm644 mstpd.service -t "$pkgdir/usr/lib/systemd/system/"
}

# vim: ft=sh:ts=2:sw=2:et
