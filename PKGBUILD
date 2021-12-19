pkgname_base=systemd-boot-manager
pkgname=$pkgname_base-git
pkgver=0.9.r22.gb85534b
pkgrel=1
pkgdesc='A simple tool to maintain systemd-boot & systemd-boot entries for Manjaro'
arch=(any)
conflicts=("systemd-boot-manager")
provides=("systemd-boot-manager")
url='https://gitlab.com/dalto.8/systemd-boot-manager'
license=(GPL2)
backup=('etc/sdboot-manage.conf')
depends=(systemd
         findutils
         grep
         gawk)
source=(git+https://gitlab.com/dalto.8/systemd-boot-manager.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname_base"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
    install -D -m755 "${srcdir}/${pkgname_base}/sdboot-manage" "${pkgdir}/usr/bin/sdboot-manage"
    install -D -m644 "${srcdir}/${pkgname_base}/sdboot-manage.conf" "${pkgdir}/etc/sdboot-manage.conf"
    install -D -m644 "${srcdir}/${pkgname_base}/sdboot-kernel-update.hook" "${pkgdir}/usr/share/libalpm/hooks/sdboot-kernel-update.hook"
    install -D -m644 "${srcdir}/${pkgname_base}/sdboot-kernel-remove.hook" "${pkgdir}/usr/share/libalpm/hooks/sdboot-kernel-remove.hook"
    install -D -m644 "${srcdir}/${pkgname_base}/sdboot-systemd-update.hook" "${pkgdir}/usr/share/libalpm/hooks/sdboot-systemd-update.hook"
}
