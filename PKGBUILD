#
# Maintainer : Caleb McKay <caleb@candj.us>
# Contributor : Romain Gautier <romain.gautier@nimamoh.net>,Jameson Pugh <imntreal@gmail.com>
#

pkgname=btrfsmaintenance
pkgver=0.5
pkgrel=1
pkgdesc='btrfs maintenance scripts'
arch=('any')
url='https://github.com/kdave/btrfsmaintenance'
license=('GPL2')
depends=('bash')
conflicts=("${pkgname}-git")
source=("https://github.com/kdave/btrfsmaintenance/archive/v${pkgver}.tar.gz")
sha256sums=('0de747e630155ecbc438dfac23ffee00cb3f2ee4d01bb67724ef81826709cacb')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm 0755                                  "${pkgdir}/usr/lib/systemd/system"
  install -dm 0755                                  "${pkgdir}/etc/default"
  install -m 0644 sysconfig.btrfsmaintenance        "${pkgdir}/etc/default/btrfsmaintenance"

  install -dm 0755                                  "${pkgdir}/usr/share/btrfsmaintenance"
  install -m 0755 btrfs-*.sh                        "${pkgdir}/usr/share/btrfsmaintenance/"
  install -m 0644 btrfsmaintenance-functions        "${pkgdir}/usr/share/btrfsmaintenance/"

  # For cron mode
  install -m 0755 btrfsmaintenance-refresh-cron.sh  "${pkgdir}/usr/share/btrfsmaintenance/btrfsmaintenance-refresh-cron.sh"

  # For systemd
  install -m 0644 btrfsmaintenance-refresh.service  "${pkgdir}/usr/lib/systemd/system/btrfsmaintenance-refresh.service"
  install -m 0644 btrfs-[^scrub]*.service           "${pkgdir}/usr/lib/systemd/system/"
  install -m 0644 btrfs-[^scrub]*.timer             "${pkgdir}/usr/lib/systemd/system/"

  install -m 0644 README.md                         "${pkgdir}/usr/share/btrfsmaintenance/README.md"
}

# vim:set ts=2 sw=2 et:
