# Maintainer: J. Kerr <disconsented[at]disconsented[dot]com

pkgname=pufferpanel-bin
_pkgname=pufferpanel
pkgver=2.7.0
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
        '0281c464b61c7a869d0f2844d18b30728a97cd66504b3ced5cded26d4ed826f3dd340ce063d0a8f1877500782be19d586e04a8e79a9ca6ae465dbd67114d5e9f')
b2sums_x86_64=('1069a4ad06f80cf34f20bf72631ecb62e255ce12eda98a03ffb30adf67a5fecfcc92a695e63b861b1ff85eece0e732c625d9e73949718bb3a47aa4058fcc5166')
b2sums_aarch64=('cd5773a5866eb5af7feb34c2f12814455f0903c77bf5e3dae722d16a69ae251fd5bfba488895cb51a21c52257eaea0722d9f3f0b0861c035829eeb35a6ac9343')
package() {
  export pkg=pufferpanel
  mkdir -p ${pkgdir}/var/www/${pkg}/
  mkdir -p ${pkgdir}/var/lib/${pkg}/
  mkdir -p ${pkgdir}/var/log/${pkg}/
  mkdir -p ${pkgdir}/etc/${pkg}/
  cp -R --no-preserve=ownership ${srcdir}/www/* "${pkgdir}/var/www/${pkg}"
  cp -R --no-preserve=ownership "${srcdir}/email/" "${pkgdir}/etc/${pkg}/"
  install -D -m 755 "${srcdir}/${pkg}" "${pkgdir}/usr/bin/${pkg}" 
  install -D -m 644 "${srcdir}/config.linux.json" "${pkgdir}/etc/${pkg}/config.json" 
  install -D -m 644 "${srcdir}/pufferpanel.service" "${pkgdir}/usr/lib/systemd/system/pufferpanel.service" 
  install -D -m 644 "${srcdir}/../pufferpanel.sysusers" "${pkgdir}/usr/lib/sysusers.d/pufferpanel.conf"
  install -D -m 644 "${srcdir}/../pufferpanel.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/pufferpanel.conf"
}
