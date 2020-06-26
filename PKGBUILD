# Maintainer: J. Kerr <disconsented[at]disconsented[dot]com

pkgname=pufferpanel-bin
_pkgname=pufferpanel
pkgver=2.0.0_alpha.3
pkgrel=1
pkgdesc="PufferPanel: A web-base game management system (binary version)."
arch=('x86_64')
url="https://github.com/PufferPanel/PufferPanel"
license=('Apache')
provides=('pufferpanel')
conflicts=('pufferpanel')
optdepends=('nginx: TLS support'
			'postgres: Dedicated database'
			'docker: Container support'
                        'sqlite: Database support')
depends=()
source=(https://github.com/PufferPanel/PufferPanel/releases/download/v${pkgver//_/-}/pufferpanel_${pkgver//_/-}_amd64.zip 
		https://raw.githubusercontent.com/PufferPanel/PufferPanel/v${pkgver//_/-}/systemd/servicefiles/pufferpanel.service
               https://raw.githubusercontent.com/PufferPanel/PufferPanel/v${pkgver//_/-}/config.linux.json)
b2sums=('ff2e7bb2d8dcc9e7ce01b7d110790a1151a46af484ade3839780c4f2c641ae77562161ac7f9d96a29686db07d0ee05107ce7b182d0c492cccd76887907c3d354'
        'ed744c35200b918c3107ea6191e3c6c38b3a731183b5cf7ed8b066550a6038fd712429b24264b0b00c52f9533b8503462962d2bfdb45c49724be49a2b9b39141'
        'deab865a5dabfc82d448928bcaf92c3cc693a7345aad148f255a4e8a3ecf94ad39b41d6e47a69026af4b063c0bb978c0a388f3fae9adcb45facde637bdd2933b')
package() {
  export pkg=pufferpanel
  install -D "${srcdir}/pufferpanel" "${pkgdir}/usr/bin/pufferpanel" 
  install -D "${srcdir}/config.linux.json" "${pkgdir}/etc/pufferpanel/config.json" 
  mkdir -p ${pkgdir}/var/www/${pkg}/
  cp -R "${srcdir}/www/" "${pkgdir}/var/"
  cp -R "${srcdir}/email/" "${pkgdir}/etc/${pkg}/"
  install -D "${srcdir}/pufferpanel.service" "${pkgdir}/etc/systemd/system/pufferpanel.service" 
  install -D -m 644 "${srcdir}/pufferpanel.sysusers" "${pkgdir}/usr/lib/sysusers.d/pufferpanel.conf"
  install -D -m 644 "${srcdir}/pufferpanel.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/pufferpanel.conf"
}
