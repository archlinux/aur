# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vflow-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Enterprise Network Flow Collector (IPFIX, sFlow, Netflow) from Verizon Digital Media Services"
arch=('x86_64')
url='https://github.com/VerizonDigital/vflow'
license=('Apache-2.0')
provides=("${pkgname%-bin}")
depends=('kafka')
source=("https://github.com/VerizonDigital/vflow/releases/download/v${pkgver}/vflow-${pkgver}-x86_64.rpm"
		'vflow.service')
sha256sums=('b94c6e6249f2ba53fbe89470bb61357e5ead0447ad0343382d2448f90bfa4ee8'
			'074d4ef942becc4e574a8f77e7b2697b760ac72fdabf1d0ad19105a6edc29fe5')

package() {
  mv "${srcdir}/usr" "${pkgdir}/"
  mv "${srcdir}/etc" "${pkgdir}/"
  mkdir -p "${pkgdir}/usr/share/licenses/vflow"
  mkdir -p "${pkgdir}/etc/rc.d/init.d"
  mv "${pkgdir}/usr/share/doc/vflow/license" \
   "${pkgdir}/usr/share/licenses/vflow/LICENSE"
  mv "${pkgdir}/usr/share/doc/vflow/notice" \
   "${pkgdir}/usr/share/licenses/vflow/NOTICE"
  mv "${pkgdir}/etc/init.d/vflow" "${pkgdir}/etc/rc.d/init.d"
  install -Dm644 "${srcdir}/vflow.service" \
   "$pkgdir/usr/lib/systemd/system/vflow@.service"
  rm -rf "${pkgdir}/etc/init.d/"
  rm -rf "${pkgdir}/usr/share/doc"
}