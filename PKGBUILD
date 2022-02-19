# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Julien Sopena <jsopena.archlinux@free.fr>
# Contributor: Adam Nielsen <malvineous@shikadi.net>
pkgname=smcroute
pkgver=2.5.5
pkgrel=1
pkgdesc="A command line tool to manipulate the multicast routes of a UNIX kernel. It supports both IPv4 and IPv6 multicast routing."
arch=('i686' 'x86_64')
url="https://troglobit.com/smcroute.html"
license=('GPL2')
provides=('smcroute' 'mcsender')
backup=('etc/smcroute.conf')
depends=('libcap' 'bash')
source=("https://github.com/troglobit/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        'smcroute.conf.example'
        'smcroute.service')
md5sums=('6ed58b4887ccb737687b584f5794c7ed'
         '98bdb5bbd222686761e318ee04825b7a'
         '7b28500642045b2482f5ac873da0f86b')
sha256sums=('2569cd97fa2047df14203a7144be53a1b32928cb460421a302bbcce381b42bc3'
            'cd62ffd5ca24d41552591592aaed0448c6e9b379a62b9820851798d68b3cbe1c'
            '0d970e38abde99694df7959809e9323ef8d85ed1e62e352b681e325a935a8959')

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
