# Maintainer: Julien Sopena (jsopena.archlinux@free.fr)
pkgname="smcroute"
pkgver="1.99.0"
pkgrel=2
pkgdesc="A command line tool to manipulate the multicast routes of a UNIX kernel. It supports both IPv4 and IPv6 multicast routing."
arch=('i686' 'x86_64')
url="https://github.com/troglobit/smcroute"
license=('GPL2')
depends=(bash)
provides=('smcroute' 'mcsender')
backup=('etc/smcroute.conf')
source=("https://github.com/downloads/troglobit/smcroute/$pkgname-$pkgver.tar.bz2"
        'smcroute.conf.example'
        'smcroute.service')
noextract=()   
md5sums=('8f3e3abd6891141c7d5e555c6315ddfd'
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
