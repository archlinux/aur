# Maintainer: J. Kerr <disconsented[at]disconsented[dot]com

pkgname=pufferpanel-bin
_pkgname=pufferpanel
pkgver=3.0.1
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
b2sums_x86_64=('5aa474bf2ef27e312cfbe7de64601339a2abaa2980ff5572c95846900d3948d89dc3f950223e8700a21f4150b1fa93165227f7a4631e99412c6c649b8290301c')
b2sums_aarch64=('2227d60ef8f64f35c84385c95011f9466eb5b5336e778219fb071e83e28ba2cb4dcb5de669de08be6c07b05bcfa002105b7fd3776012479b18480def22592f34')
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
