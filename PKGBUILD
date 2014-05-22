# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Julien Sopena (jsopena.archlinux@free.fr)
pkgname="smcroute"
pkgver="1.99.2"
pkgrel=1
pkgdesc="A command line tool to manipulate the multicast routes of a UNIX kernel. It supports both IPv4 and IPv6 multicast routing."
arch=('i686' 'x86_64')
url="https://troglobit.com/smcroute.html"
license=('GPL2')
provides=('smcroute' 'mcsender')
backup=('etc/smcroute.conf')
depends=('glibc')
source=("ftp://troglobit.com/smcroute/$pkgname-$pkgver.tar.bz2"
        'smcroute.conf.example'
        'smcroute.service')
md5sums=('47e2a8157b32a8b9aa34133878ffe3b5'
         '59fdb2baf1184d0cb5c59b576b1b5e1c'
         '7b28500642045b2482f5ac873da0f86b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 "${srcdir}/smcroute.conf.example" "${pkgdir}/etc/smcroute.conf"
  install -Dm644 "${srcdir}/smcroute.service" "${pkgdir}/usr/lib/systemd/system/smcroute.service"
}

# vim:set ts=2 sw=2 et:
