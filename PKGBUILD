# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Christoph Zeiler <rabyte*gmail>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=firetable
pkgver=5.4
pkgrel=1
pkgdesc="An iptables firewall script"
arch=('any')
url="http://projects.leisink.net/Firetable/"
license=('GPL')
depends=('iptables' 'php')
makedepends=('patch')
backup=('etc/firetable/firetable.conf'
        'etc/firetable/ipv6_eth0'
        'etc/firetable/ipv4_eth0')
install="${pkgname}.install"
source=("http://projects.leisink.net/Firetable/$pkgname-$pkgver.tar.gz"
        "${pkgname}.service"
        'firetable-start'
        'fix-bin-paths.patch')
md5sums=('e30e086bcc3458ef7531033148fed375'
         '54db225ce6f7287f69f97a398cdec01f'
         '2232c8c0fdb53d297c99038ae08cc05a'
         'a5c4057f31c6b4ea662ab0268e817adc')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p0 < "$srcdir"/fix-bin-paths.patch
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  
  make DESTDIR="$pkgdir" install

  # install systemd service unit
  install -Dm644 "$srcdir"/${pkgname}.service "$pkgdir"/etc/systemd/system/${pkgname}.service
  install -Dm755 "$srcdir"/firetable-start "$pkgdir"/usr/bin/firetable-start
}

# vim:set ts=2 sw=2 et:
