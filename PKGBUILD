# Maintainer: J. Kerr <disconsented[at]disconsented[dot]com

pkgname=pufferpanel-bin
_pkgname=pufferpanel
pkgver=2.6.6
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
        'bfc43954775e7795376cb86b7d2599031d576640fb6e13a5d5e8d915b5eb7bf36079600e5acc07c672b77e22b1b19799074defeced96a9638c5420733c9eb096')
b2sums_x86_64=('4c53846d223559097b4cdf1c4fb556725923cfc9376b43863890d5a2e492094d9fe5cf190801973cc8b6167e42300f80d67945f87e57feac702aa395093ee23c')
b2sums_aarch64=('1c6be430f0b11f09ea07fecdbf3aae079277fc5d5d31cf8c3bb5da0d8bec7b243db41035e8b219fc576a68bdfdd14d940ef576a7f971db8e6b0f1f5b2b9c8399')
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
