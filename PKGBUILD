# Maintainer: Joaquin (Pato) Decima <jdecima@vasak.net.ar>

pkgname=twingate-bin
_pkgname=twingate
pkgver=2026.188.6692
pkgrel=1
pkgdesc="Zero trust remote access client for resource and networks, based on twingate-bin"
arch=('x86_64' 'aarch64')
license=(LicenseRef-Proprietary)
url="https://twingate.com"
depends=('systemd' 'cryptsetup' 'dbus')
install=$pkgname.install
source_x86_64=(twingate-${pkgver}-x86_64.tar.zst::https://binaries.twingate.com/client/linux/ARCH/x86_64/stable/twingate-amd64.pkg.tar.zst)
source_aarch64=(twingate-${pkgver}-aarch64.tar.zst::https://binaries.twingate.com/client/linux/ARCH/aarch64/stable/twingate-arm64.pkg.tar.zst)
sha256sums_x86_64=('7b1a3fc6ada23940d6df45d2521143d46ceb0c91797c0959c4621656f7d25ae1')
sha256sums_aarch64=('170f7d2904b0fa5495d9f8bda341679928f68363ef7d47faac1131e25d0b549d')

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
