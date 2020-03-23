# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
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
url='ftp://ftp.suse.com/pub/people/kukuk/ipv6/'
license=('BSD')
depends=('ncurses')
conflicts=('netkit-telnet' 'inetutils')
source=(
  #"http://ftp.isr.ist.utl.pt/pub/MIRRORS/ftp.suse.com/people/kukuk/ipv6/$pkgname-$pkgver.tar.bz2"
  "https://dev.gentoo.org/~mschiff/distfiles/telnet-bsd-1.2.tar.bz2"
  'telnet.xinetd'
  'telnet.socket'
  'telnet@.service'
)
optdepends=('xinetd')
backup=('etc/xinetd.d/telnet')
sha256sums=('d6a9d26740ef75565cb1ed8ff11e327d240e6734748b2d1d2e96c126849e4733'
            '2625ffbad4201fcf88901975b01f2ab6cde3ad32c188e10a0d1944fa904f5f37'
            '5597fd2f5187efe317c828ea9d925697d86ce3ede38f56c33b166d31ca73b19b'
            '31e6733053ecdee40da0b9ced8f0d45518c1f45bf7173d757633de6d13b58475')

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
