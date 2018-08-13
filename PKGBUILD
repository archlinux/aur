#
# Maintainer : Romain Gautier <romain.gautier@nimamoh.net>
# Contributor : Jameson Pugh <imntreal@gmail.com>
#

pkgname=btrfsmaintenance
pkgver=0.4.1
pkgrel=3
pkgdesc='btrfs maintenance scripts'
arch=('any')
url='https://github.com/kdave/btrfsmaintenance'
license=('GPL2')
depends=('bash')
conflicts=("${pkgname}-git")
source=("https://github.com/kdave/btrfsmaintenance/archive/v${pkgver}.tar.gz")
sha256sums=('32f70c3667231ace8c4218f2dbf7e76b5451907adfb0798323d14ad1455b1fac')

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
