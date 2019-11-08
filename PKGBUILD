# Author: RedTide <redtid3@gmail.com>

srcname="archlinux-realtime-generic-setup"
pkgname="realtime-generic-setup"
pkgdesc="Generic realtime setup configuration"
pkgver=r4.a423690
pkgrel=1
arch=('any')
optdepends=('linux-rt: The Linux-rt kernel and modules'
            'rtirq: Realtime IRQ thread system tuning')
url="https://github.com/redtide/${srcname}"
source=("git://github.com/redtide/${srcname}.git")
md5sums=('SKIP')
pkgver() {
  cd "$srcname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
    cd "${srcdir}/${srcname}"
    install -Dm644 "${srcdir}/${srcname}/90-max_user_watches.conf" "${pkgdir}/etc/sysctl.d/90-max_user_watches.conf"
    install -Dm644 "${srcdir}/${srcname}/90-swappiness.conf" "${pkgdir}/etc/sysctl.d/90-swappiness.conf"
    install -Dm644 "${srcdir}/${srcname}/realtime.service" "${pkgdir}/usr/lib/systemd/system/realtime.service"
    install -Dm755 "${srcdir}/${srcname}/realtime.sh" "${pkgdir}/usr/bin/realtime.sh"
}
