# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=inputlirc
pkgver=34
pkgrel=1
pkgdesc="Zeroconf LIRC daemon using input event devices"
arch=('x86_64')
url="https://github.com/gsliepen/inputlirc"
license=('GPL')
backup=(etc/default/inputlirc)
source=(https://ftp.debian.org/debian/pool/main/i/inputlirc/inputlirc_$pkgver.orig.tar.gz
        inputlirc.default)
sha256sums=('6ff52376c226c7cb49fbe053365eb4931c97a9edfa503ee4ebb689598547270c'
            '273789d4225c880b3058b9d2e2931f5ef5c83125e39a12424741007b5d85cc2e')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -r 's/^After=.*/After=systemd-udev-settle.service lircd.service/' -i inputlirc.service
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr SBINDIR=/usr/bin
  install -Dm644 "$srcdir"/inputlirc.default "$pkgdir"/etc/default/inputlirc
}
