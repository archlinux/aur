# Maintainer: Alex R <alex at ironrobin dot net>

pkgname=twingate-bin
_pkgname=twingate
pkgdesc="Twingate (twingate): Client for providing secure access to private resources for distributed workforces under a zero trust networking model"
pkgver=0.149.1
pkgrel=0
arch=('aarch64' 'x86_64')
url="https://www.twingate.com/"
depends=('sudo' 'cryptsetup' 'curl' 'dbus' 'libnl')
install=$pkgname.install

source_aarch64=(twingate_arm64_${pkgver}.tar.zst::https://binaries.twingate.com/client/linux/ARCH/aarch64/stable/twingate-arm64.pkg.tar.zst)
source_x86_64=(twingate_x64_${pkgver}.tar.zst::https://binaries.twingate.com/client/linux/ARCH/x86_64/stable/twingate-amd64.pkg.tar.zst)
sha256sums_aarch64=('0da1200e8c108d52ec85f817c81e19d3dd1340fd13e20e8e5e1c44f16a32bc2e')
sha256sums_x86_64=('c2a8f7eae9af1f5cb548362a31c4ddac3f1c87af8a85c89db45b29aecf10faa6')

package() {
  install -d "${pkgdir}/var/lib/${_pkgname}"
  install -d "${pkgdir}/run/${_pkgname}"

  install -Dm 644 "${srcdir}/usr/share/bash-completion/completions/${_pkgname}" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm 644 "${srcdir}/usr/lib/systemd/system/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm 644 "${srcdir}/usr/lib/systemd/system-preset/${_pkgname}.preset" "${pkgdir}/usr/lib/systemd/system-preset/${_pkgname}.preset"
  install -Dm 644 "${srcdir}/usr/lib/systemd/user/${_pkgname}-desktop-notifier.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}-desktop-notifier.service"

  install -Dm 644 "${srcdir}/etc/${_pkgname}/autostart.conf" "${pkgdir}/etc/${_pkgname}/autostart.conf"
  install -Dm 644 "${srcdir}/etc/${_pkgname}/config.json" "${pkgdir}/etc/${_pkgname}/config.json"
  install -Dm 644 "${srcdir}/etc/${_pkgname}/controller_url.conf" "${pkgdir}/etc/${_pkgname}/controller_url.conf"
  install -Dm 644 "${srcdir}/etc/${_pkgname}/network.conf" "${pkgdir}/etc/${_pkgname}/network.conf"
  install -Dm 644 "${srcdir}/etc/${_pkgname}/sentry_user_consent.conf" "${pkgdir}/etc/${_pkgname}/sentry_user_consent.conf"
  
  install -Dm 644 "${srcdir}/etc/xdg/autostart/${_pkgname}-autostart.desktop" "${pkgdir}/etc/xdg/autostart/${_pkgname}-autostart.desktop"

  install -Dm 755 "${srcdir}/usr/bin/twingate" "${pkgdir}/usr/bin/twingate"
  install -Dm 755 "${srcdir}/usr/bin/twingate-notifier" "${pkgdir}/usr/bin/twingate-notifier"
  install -Dm 755 "${srcdir}/usr/bin/twingated" "${pkgdir}/usr/bin/twingated" 
}
