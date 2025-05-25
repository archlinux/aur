# Maintainer: Alois~ <aloisianer@proton.me>
pkgname=twingate
pkgver=1.0
pkgrel=2
pkgdesc="Zero trust remote access client for resource and networks, based on twingate-bin"
arch=('x86_64' 'aarch64')
options=('!debug')
url="https://twingate.com"
depends=('sudo' 'cryptsetup' 'curl' 'dbus' 'libnl')
install=$pkgname.install

source_aarch64=(twingate_arm64_${pkgver}.tar.zst::https://binaries.twingate.com/client/linux/ARCH/aarch64/stable/twingate-arm64.pkg.tar.zst)
source_x86_64=(twingate_x64_${pkgver}.tar.zst::https://binaries.twingate.com/client/linux/ARCH/x86_64/stable/twingate-amd64.pkg.tar.zst)
sha256sums_aarch64=('SKIP')
sha256sums_x86_64=('SKIP')

package() {
  install -dm 755 "${pkgdir}/var/lib/${pkgname}"
  install -dm 755 "${pkgdir}/run/${pkgname}"

  install -Dm 644 "${srcdir}/usr/share/bash-completion/completions/${pkgname}" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm 644 "${srcdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm 644 "${srcdir}/usr/lib/systemd/system-preset/${pkgname}.preset" "${pkgdir}/usr/lib/systemd/system-preset/${pkgname}.preset"
  install -Dm 644 "${srcdir}/usr/lib/systemd/user/${pkgname}-desktop-notifier.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}-desktop-notifier.service"

  install -Dm 644 "${srcdir}/etc/${pkgname}/autostart.conf" "${pkgdir}/etc/${pkgname}/autostart.conf"
  install -Dm 644 "${srcdir}/etc/${pkgname}/config.json" "${pkgdir}/etc/${pkgname}/config.json"
  install -Dm 644 "${srcdir}/etc/${pkgname}/controller_url.conf" "${pkgdir}/etc/${pkgname}/controller_url.conf"
  install -Dm 644 "${srcdir}/etc/${pkgname}/network.conf" "${pkgdir}/etc/${pkgname}/network.conf"
  install -Dm 644 "${srcdir}/etc/${pkgname}/sentry_user_consent.conf" "${pkgdir}/etc/${pkgname}/sentry_user_consent.conf"
  
  install -Dm 644 "${srcdir}/etc/xdg/autostart/${pkgname}-autostart.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}-autostart.desktop"

  install -Dm 755 "${srcdir}/usr/bin/twingate" "${pkgdir}/usr/bin/twingate"
  install -Dm 755 "${srcdir}/usr/bin/twingate-notifier" "${pkgdir}/usr/bin/twingate-notifier"
  install -Dm 755 "${srcdir}/usr/bin/twingated" "${pkgdir}/usr/bin/twingated" 
}
