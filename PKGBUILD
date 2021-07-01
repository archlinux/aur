# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Tyler Veness <calcmogul at gmail dot com>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Thanh Ha <thanh.ha at alumni.carleton dot ca>
# Contributor: Marcel Huber <marcelhuberfoo at gmail dot com>

pkgname=gerrit
pkgver=3.4.0
pkgrel=2
pkgdesc="A web-based code review tool built on top of the Git version control system"
arch=('any')
url="https://www.gerritcodereview.com/"
license=('Apache')
depends=('java-runtime<13' 'libcups')
optdepends=('bcprov: Java cryptography APIs (Bouncy Castle)')
backup=(etc/default/gerritcodereview)
install=gerrit.install
source=("https://gerrit-releases.storage.googleapis.com/gerrit-$pkgver.war"
        gerrit.conf
        gerrit.systemd)
noextract=(gerrit.war)
sha256sums=('18d52948af5c7331884b2be8d392ab2f378efb3466e5d1183a65f63b2ed38f31'
            '35becf2754e3779c750b2889909349160c2b0584ec201f6cfb5cf2c42e6fc598'
            'be1d205c6a0f3b24aad3c385f8188c64bfa3a9799ecf8ce5e089149af991a645')

package() {
  install -D -m 444 "$srcdir/gerrit-$pkgver.war" "$pkgdir/usr/share/java/gerrit/gerrit.war"
  install -D -m 644 "$srcdir/gerrit.systemd" "$pkgdir/usr/lib/systemd/system/gerrit.service"
  install -D -m 644 "$srcdir/gerrit.conf" "$pkgdir/etc/default/gerritcodereview"
  install -m 755 -d "$pkgdir/var/lib/gerrit"
}

# vim:set ts=2 sw=2 et:
