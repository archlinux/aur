# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vflow-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Enterprise Network Flow Collector (IPFIX, sFlow, Netflow) from Verizon Digital Media Services"
arch=('x86_64')
url='https://github.com/VerizonDigital/vflow'
license=('Apache')
provides=("${pkgname%-bin}")
depends=('kafka' 'bash')
source=("${pkgname}-${pkgver}.rpm::https://github.com/VerizonDigital/vflow/releases/download/v${pkgver}/vflow-${pkgver}-0.x86_64.rpm"
    'vflow.service')
sha256sums=('9a685ad53216729171e593dafe519af2f0c622f63b3b7c360475ddbfde6c33f2'
            '074d4ef942becc4e574a8f77e7b2697b760ac72fdabf1d0ad19105a6edc29fe5')

package() {
  mv "${srcdir}/usr" "${pkgdir}/"
  mv "${srcdir}/etc" "${pkgdir}/"
  mkdir -p "${pkgdir}/etc/rc.d/init.d"
  mv "${pkgdir}/etc/init.d/vflow" "${pkgdir}/etc/rc.d/init.d"
  install -Dm644 "${srcdir}/vflow.service" \
   "$pkgdir/usr/lib/systemd/system/vflow@.service"
  rm -rf "${pkgdir}/etc/init.d/"
}
