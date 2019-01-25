# Maintainer: Code Imp  <code_imp@bk.ru>
#
_pkgbase=veeam
pkgname=veeam
pkgver=3.0.0.865
pkgrel=1
pkgdesc="Veeam Agent for Linux"
arch=('x86_64')
url=http://repository.veeam.com/backup/linux/agent
license=('Proprietary')
depends=('ncurses' 'lvm2' 'fuse' 'rpmextract')
install=${pkgname}.install
source=( "${url}/rpm/el/7/x86_64/veeam-${pkgver}-1.el7.x86_64.rpm" )
conflicts=("${_pkgbase}")
md5sums=('1fad5f089714599e92bb222e4cc2ab81')
#
build() {
  msg "build..."
  rpmextract.sh veeam-${pkgver}-1.el7.x86_64.rpm
}
#
package() {
  # Install
  msg2 "package..."

  install -Dm 0644 "${srcdir}/etc/veeam/veeam.ini" "${pkgdir}/etc/veeam/veeam.ini"
  install -Dm 0744 "${srcdir}/lib/systemd/system/veeamservice.service" "${pkgdir}/usr/lib/systemd/system/veeamservice.service"
  install -Dm 0755 "${srcdir}/usr/bin/veeam" "${pkgdir}/usr/bin/veeam"
  install -Dm 0755 "${srcdir}/usr/bin/veeamconfig" "${pkgdir}/usr/bin/veeamconfig"
  install -Dm 0755 "${srcdir}/usr/sbin/veeamagentid" "${pkgdir}/usr/bin/veeamagentid"
  install -Dm 0755 "${srcdir}/usr/sbin/veeammount" "${pkgdir}/usr/bin/veeammount"
  install -Dm 0755 "${srcdir}/usr/sbin/veeamagent" "${pkgdir}/usr/bin/veeamagent"
  install -Dm 0755 "${srcdir}/usr/sbin/veeamjobman" "${pkgdir}/usr/bin/veeamjobman"
  install -Dm 0755 "${srcdir}/usr/sbin/veeamservice" "${pkgdir}/usr/bin/veeamservice"
  install -Dm 0644 "${srcdir}/usr/share/doc/veeam/3rd_party" "${pkgdir}/usr/share/doc/veeam/3rd_party"
  install -Dm 0644 "${srcdir}/usr/share/doc/veeam/EULA" "${pkgdir}/usr/share/doc/veeam/EULA"
  install -Dm 0644 "${srcdir}/usr/share/man/man8/veeam.8" "${pkgdir}/usr/share/man/man8/veeam.8"  
  install -Dm 0644 "${srcdir}/usr/share/man/man8/veeamconfig.8" "${pkgdir}/usr/share/man/man8/veeamconfig.8"
  install -Dm 0644 "${srcdir}/usr/share/veeam/lpb_scheme.sql" "${pkgdir}/usr/share/veeam/lpb_scheme.sql"
  install -Dm 0644 "${srcdir}/usr/share/veeam/lpb_upgrade_scheme.sql" "${pkgdir}/usr/share/veeam/lpb_upgrade_scheme.sql"
}
