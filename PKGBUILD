#
# Maintainer : Caleb McKay <caleb@candj.us>
# Contributor : Romain Gautier <romain.gautier@nimamoh.net>,Jameson Pugh <imntreal@gmail.com>
#

pkgname=btrfsmaintenance
pkgver=0.5
pkgrel=2
pkgdesc='btrfs maintenance scripts'
arch=('any')
url='https://github.com/kdave/btrfsmaintenance'
license=('GPL2')
depends=('bash')
conflicts=("${pkgname}-git")
backup=(etc/default/btrfsmaintenance)
source=("https://github.com/kdave/btrfsmaintenance/archive/v${pkgver}.tar.gz")
sha256sums=('0de747e630155ecbc438dfac23ffee00cb3f2ee4d01bb67724ef81826709cacb')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -E -i 's|/etc/sysconfig/|/etc/default/|' btrfsmaintenance-refresh.path
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 sysconfig.btrfsmaintenance "$pkgdir/etc/default/btrfsmaintenance"
  install -dm755 "$pkgdir/"{usr/lib/systemd/system,usr/share/btrfsmaintenance}
  install -Dm755 btrfs-*.sh btrfsmaintenance-{functions,refresh-cron.sh} README.md "$pkgdir/usr/share/btrfsmaintenance"
  install -Dm644 *.service *.timer *.path "$pkgdir/usr/lib/systemd/system"
}

# vim:set ts=2 sw=2 et:
