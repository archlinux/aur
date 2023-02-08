# Maintainer: J. Kerr <disconsented[at]disconsented[dot]com

pkgname=pufferpanel-bin
_pkgname=pufferpanel
pkgver=2.6.1
pkgrel=1
pkgdesc="PufferPanel: A web-base game management system (binary version)."
arch=('x86_64' 'aarch64')
url="https://github.com/PufferPanel/PufferPanel"
license=('Apache')
provides=('pufferpanel')
conflicts=('pufferpanel')
optdepends=('nginx: TLS support'
			'postgresql: Dedicated database'
			'docker: Container support'
                        'sqlite: Database support')
depends=()
source_aarch64=(https://github.com/PufferPanel/PufferPanel/releases/download/v${pkgver///-}/pufferpanel_${pkgver///-}_linux_arm64.zip)
source_x86_64=(https://github.com/PufferPanel/PufferPanel/releases/download/v${pkgver///-}/pufferpanel_${pkgver///-}_linux_amd64.zip)
source=(https://raw.githubusercontent.com/PufferPanel/PufferPanel/v${pkgver//_/-}/systemd/servicefiles/pufferpanel.service
               https://raw.githubusercontent.com/PufferPanel/PufferPanel/v${pkgver//_/-}/config.linux.json)
b2sums=('ed744c35200b918c3107ea6191e3c6c38b3a731183b5cf7ed8b066550a6038fd712429b24264b0b00c52f9533b8503462962d2bfdb45c49724be49a2b9b39141'
        '87d5cbcd6652209913527fc595ec457659ff05c759b6b4ff4d0154e856adc2056640b4dceff9216b0a118751e24bf1b43b80ff6fe3ad74e0ce45f5c82bc59f7e')
b2sums_x86_64=('b51f29002241c63997cd548c00186011bdfc81f4bf12b844f6766f91b3b32062643e80980a4b8cff319bee5f8c6f5d80a55d0ea684b11041a8bef95e560f4e8b')
b2sums_aarch64=('2d9173a61bd15dedd58c8d6096fe3cf3576891bcf13173f92bddbe70dcbe92950e64d43519831d31bef604c3389fc83c3646c329aded9901bb2f78f520d11109')
package() {
  export pkg=pufferpanel
  mkdir -p ${pkgdir}/var/www/${pkg}/
  mkdir -p ${pkgdir}/var/lib/${pkg}/
  mkdir -p ${pkgdir}/var/log/${pkg}/
  mkdir -p ${pkgdir}/etc/${pkg}/
  cp -R --no-preserve=ownership ${srcdir}/www/* "${pkgdir}/var/www/${pkg}"
  cp -R --no-preserve=ownership "${srcdir}/email/" "${pkgdir}/etc/${pkg}/"
  install -Dm 755 "${srcdir}/${pkg}" "${pkgdir}/usr/bin/${pkg}" 
  install -Dm 644 "${srcdir}/config.linux.json" "${pkgdir}/etc/${pkg}/config.json" 
  install -D "${srcdir}/pufferpanel.service" "${pkgdir}/etc/systemd/system/pufferpanel.service" 
  install -D -m 644 "${srcdir}/../pufferpanel.sysusers" "${pkgdir}/usr/lib/sysusers.d/pufferpanel.conf"
  install -D -m 644 "${srcdir}/../pufferpanel.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/pufferpanel.conf"
}
