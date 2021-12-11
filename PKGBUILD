# Maintainer: J. Kerr <disconsented[at]disconsented[dot]com

pkgname=pufferpanel-bin
_pkgname=pufferpanel
pkgver=2.4.0
pkgrel=1
pkgdesc="PufferPanel: A web-base game management system (binary version)."
arch=('x86_64')
url="https://github.com/PufferPanel/PufferPanel"
license=('Apache')
provides=('pufferpanel')
conflicts=('pufferpanel')
optdepends=('nginx: TLS support'
			'postgresql: Dedicated database'
			'docker: Container support'
                        'sqlite: Database support')
depends=()
source=(https://github.com/PufferPanel/PufferPanel/releases/download/v${pkgver//_/-}/pufferpanel_${pkgver//_/-}_linux_amd64.zip
		https://raw.githubusercontent.com/PufferPanel/PufferPanel/v${pkgver//_/-}/systemd/servicefiles/pufferpanel.service
               https://raw.githubusercontent.com/PufferPanel/PufferPanel/v${pkgver//_/-}/config.linux.json)
b2sums=('ba9de04c7932332a4a48b04a60015cb1f35c3c85da6dce2cc9f60bff9f03617edf02c9de33b157054a2a6ba54e7666cc7b333f6bb17a80bdd40e50a0eb116e3f'
        'ed744c35200b918c3107ea6191e3c6c38b3a731183b5cf7ed8b066550a6038fd712429b24264b0b00c52f9533b8503462962d2bfdb45c49724be49a2b9b39141'
        '8e71e40eab92d6d49d7c71998256a849aa1027142cc3d8a9d8e418b6a7f66cac5eeff4f6e8d73ff8389746513ef7d74b2b0ef6b42b4e857c1906ce21a4d14f81')
package() {
  export pkg=pufferpanel
  install -D "${srcdir}/pufferpanel" "${pkgdir}/usr/bin/pufferpanel" 
  install -D "${srcdir}/config.linux.json" "${pkgdir}/etc/pufferpanel/config.json" 
  mkdir -p ${pkgdir}/var/www/${pkg}/
  cp -R ${srcdir}/www/* "${pkgdir}/var/www/${pkg}"
  cp -R "${srcdir}/email/" "${pkgdir}/etc/${pkg}/"
  install -D "${srcdir}/pufferpanel.service" "${pkgdir}/etc/systemd/system/pufferpanel.service" 
  install -D -m 644 "${srcdir}/../pufferpanel.sysusers" "${pkgdir}/usr/lib/sysusers.d/pufferpanel.conf"
  install -D -m 644 "${srcdir}/../pufferpanel.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/pufferpanel.conf"
}
