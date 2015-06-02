# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=telnet-bsd
pkgver=1.2
pkgrel=2
pkgdesc='Telnet and telnetd ported from OpenBSD'
arch=('i686' 'x86_64')
url='Unknown'
license=('BSD')
depends=('ncurses')
conflicts=('netkit-telnet' 'inetutils')
source=("http://ftp.sunet.se/pub/Linux/distributions/suse/people/kukuk/ipv6/$pkgname-$pkgver.tar.bz2"
        'telnet.xinetd'
        'telnet.socket'
        'telnet@.service')
md5sums=('72d72c65e7796dfec999f347da1c295f'
         '02a3909411d2f2d4983f4f785c94d23c'
         '46d57ace47af36468334e1d4124a2495'
         'c6f8c6f4da2687e5772a52e0b87bf70b')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr --sbindir=/usr/bin

  make
}
package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/telnet.xinetd "$pkgdir"/etc/xinetd.d/telnet

  install -Dm644 "$srcdir"/telnet.socket "$pkgdir"/usr/lib/systemd/system/telnet.socket
  install -Dm644 "$srcdir"/telnet@.service "$pkgdir"/usr/lib/systemd/system/telnet@.service

  chown -R root:root "$pkgdir/"
}

# vim:set ts=2 sw=2 et:
