# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vflow-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Enterprise Network Flow Collector (IPFIX, sFlow, Netflow) from Verizon Digital Media Services"
arch=('x86_64')
url='https://github.com/VerizonDigital/vflow'
license=('Apache')
provides=("${pkgname%-bin}")
depends=('kafka' 'bash')
source=("${pkgname}-${pkgver}.rpm::https://github.com/VerizonDigital/vflow/releases/download/v${pkgver}/vflow-${pkgver}-x86_64.rpm"
		'vflow.service')
sha256sums=('b94c6e6249f2ba53fbe89470bb61357e5ead0447ad0343382d2448f90bfa4ee8'
			'SKIP')

package() {
  mv "${srcdir}/usr" "${pkgdir}/"
  mv "${srcdir}/etc" "${pkgdir}/"
  mkdir -p "${pkgdir}/etc/rc.d/init.d"
  mv "${pkgdir}/etc/init.d/vflow" "${pkgdir}/etc/rc.d/init.d"
  install -Dm644 "${srcdir}/vflow.service" \
   "$pkgdir/usr/lib/systemd/system/vflow@.service"
  rm -rf "${pkgdir}/etc/init.d/"
}