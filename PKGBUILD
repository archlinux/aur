# Maintainer: J. Kerr <disconsented[at]disconsented[dot]com

pkgname=pufferpanel-bin
_pkgname=pufferpanel
pkgver=3.0.3
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
source_aarch64=(https://github.com/PufferPanel/PufferPanel/releases/download/v${pkgver///-}/pufferpanel_${pkgver///-}_arm64.deb)
source_x86_64=(https://github.com/PufferPanel/PufferPanel/releases/download/v${pkgver///-}/pufferpanel_${pkgver///-}_amd64.deb)
b2sums_x86_64=('94d2971aac7dca6b94b763b0a81bbcec2f280f55ebbaa1d735c415934a17fd54a9fb23e555cfc8587a71e3259f0a2d16143b4a2f5828fb4fd511fc83c75de342')
b2sums_aarch64=('724601f04483da1947bec5311d6a170cbc8215936ea6d7a4d3b4a2767d83c8340a7a269105abe6e04560ddc676d5020acc4637c132ae62a72c5ff0a90c7e8991')
package() {
  tar -xJf control.tar.xz
  tar -xJf data.tar.xz

  export pkg=pufferpanel
  install -D -m 755 "${srcdir}/etc/pufferpanel/config.json" "${pkgdir}/etc/pufferpanel/config.json"
  install -D -m 755 "${srcdir}/lib/systemd/system/pufferpanel.service" "${pkgdir}/usr/lib/systemd/system/pufferpanel.service"
  install -D -m 755 "${srcdir}/usr/sbin/pufferpanel" "${pkgdir}/usr/bin/pufferpanel"
  mkdir -p ${pkgdir}/var/lib/${pkg}/binaries ${pkgdir}/var/log/${pkg}
  install -D -m 644 "${srcdir}/../pufferpanel.sysusers" "${pkgdir}/usr/lib/sysusers.d/pufferpanel.conf"
  install -D -m 644 "${srcdir}/../pufferpanel.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/pufferpanel.conf"
}
