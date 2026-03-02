# Maintainer: J. Kerr <disconsented[at]disconsented[dot]com

pkgname=pufferpanel-bin
_pkgname=pufferpanel
pkgver=3.0.4
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
b2sums_x86_64=('5d834e0d7c8fae27e8270c1c2a9d53b74dcd5c22d79756f2bb050a62895e5b24ca1cabc342eeb8c87f98bb8a17c1fac0f427e07bb826ca58742d8ee06cdb5cb8')
b2sums_aarch64=('d7a96a7883a84022093cd3e6b5b8b3de0a67be0c9587d91c79cf855fdddd8280e51cb2015b52047a4926f8701837072a4fe78fe7946ab72031a8b52b4936e2c8')
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
