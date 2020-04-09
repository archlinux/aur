# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Julien Sopena (jsopena.archlinux@free.fr)
pkgname=smcroute
pkgver=2.4.4
pkgrel=2
pkgdesc="A command line tool to manipulate the multicast routes of a UNIX kernel. It supports both IPv4 and IPv6 multicast routing."
arch=('i686' 'x86_64')
url="https://troglobit.com/smcroute.html"
license=('GPL2')
provides=('smcroute' 'mcsender')
backup=('etc/smcroute.conf')
depends=('libcap' 'bash')
source=("https://github.com/troglobit/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
        'smcroute.conf.example'
        'smcroute.service')
md5sums=('a1dc8c54c684e8c8de139444f73a0ba3'
         '98bdb5bbd222686761e318ee04825b7a'
         '7b28500642045b2482f5ac873da0f86b')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --runstatedir=/run \
    --localstatedir=/var
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  install -Dm644 "${srcdir}/smcroute.conf.example" "${pkgdir}/etc/smcroute.conf"
  install -Dm644 "${srcdir}/smcroute.service" "${pkgdir}/usr/lib/systemd/system/smcroute.service"
  # nothing useful here
  rm -fr "${pkgdir}/usr/share/doc"
}

# vim:set ts=2 sw=2 et:
