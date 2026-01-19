# Maintainer: J. Kerr <disconsented[at]disconsented[dot]com

pkgname=pufferpanel-bin
_pkgname=pufferpanel
pkgver=3.0.0
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
b2sums_x86_64=('1f3404364d686be7af904ef8661a780bad0c3697084d6b34777311aaf2e23d5eda5e39cf896c0a68f884f874e1f37d1b5904d56cf34b31d59fdeb57f4fc46487')
b2sums_aarch64=('6f35ba5989b0a00508be3724b2d140c9c011bc87a577291afbab1547fa48172724538be6deea23602b8c9139236b110e97c4b9502f1542a4d86a263775d672da')
package() {
  pwd
  ls -lah ${srcdir}
  tar -xJf control.tar.xz
  tar -xJf data.tar.xz
  ls -lah ${srcdir}

  export pkg=pufferpanel
  install -D -m 755 "${srcdir}/etc/pufferpanel/config.json" "${pkgdir}/etc/pufferpanel/config.json"
  install -D -m 755 "${srcdir}/lib/systemd/system/pufferpanel.service" "${pkgdir}/usr/lib/systemd/system/pufferpanel.service"
  install -D -m 755 "${srcdir}/usr/sbin/pufferpanel" "${pkgdir}/usr/bin/pufferpanel"
  mkdir -p ${pkgdir}/var/lib/${pkg}/binaries ${pkgdir}/var/log/${pkg}
  install -D -m 644 "${srcdir}/../pufferpanel.sysusers" "${pkgdir}/usr/lib/sysusers.d/pufferpanel.conf"
  install -D -m 644 "${srcdir}/../pufferpanel.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/pufferpanel.conf"
}
