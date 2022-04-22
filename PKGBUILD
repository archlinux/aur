# Maintainer: RedTide <redtid3@gmail.com>

srcname="archlinux-realtime-generic-setup"
pkgname="realtime-generic-setup"
pkgdesc="Generic realtime setup configuration"
pkgver=r7.8e02b45
pkgrel=1
arch=('any')
install="${pkgname}.install"
depends=('realtime-privileges' 'fakeroot')
optdepends=('linux-rt: The Linux-rt kernel and modules'
            'htop: Interactive process viewer'
            'iotop: View I/O usage of processes'
            'rt-tests: A collection of latency testing tools for the linux(-rt) kernel'
            'rtirq: Realtime IRQ thread system tuning'
            'tuna: Thread and IRQ affinity setting GUI and cmd line tool'
            'sysstat: a collection of performance monitoring tools (iostat,isag,mpstat,pidstat,sadf,sar)'
            'schedtool: Query or alter a process scheduling policy')
url="https://github.com/redtide/${srcname}"
source=("${srcname}::git+https://github.com/redtide/${srcname}.git")
sha256sums=('SKIP')
pkgver() {
  cd "${srcdir}/$srcname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  cd "${srcdir}/${srcname}"
  install -Dm644 "${srcdir}/${srcname}/90-max_user_watches.conf" "${pkgdir}/etc/sysctl.d/90-max_user_watches.conf"
  install -Dm644 "${srcdir}/${srcname}/90-swappiness.conf" "${pkgdir}/etc/sysctl.d/90-swappiness.conf"
  install -Dm644 "${srcdir}/${srcname}/realtime.service" "${pkgdir}/usr/lib/systemd/system/realtime.service"
  install -Dm755 "${srcdir}/${srcname}/realtime.sh" "${pkgdir}/usr/bin/realtime.sh"
}
