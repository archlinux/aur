# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=frida-server-android-bin
pkgver=17.9.11
pkgrel=1
pkgdesc='Frida server binaries for Android targets'
arch=('any')
url='https://frida.re'
license=('LicenseRef-wxWindows-3.1')
options=('!strip' '!debug')

source=(
  "${pkgname}-${pkgver}-COPYING::https://raw.githubusercontent.com/frida/frida/${pkgver}/COPYING"
  "frida-server-${pkgver}-android-arm.xz::https://github.com/frida/frida/releases/download/${pkgver}/frida-server-${pkgver}-android-arm.xz"
  "frida-server-${pkgver}-android-arm64.xz::https://github.com/frida/frida/releases/download/${pkgver}/frida-server-${pkgver}-android-arm64.xz"
  "frida-server-${pkgver}-android-x86.xz::https://github.com/frida/frida/releases/download/${pkgver}/frida-server-${pkgver}-android-x86.xz"
  "frida-server-${pkgver}-android-x86_64.xz::https://github.com/frida/frida/releases/download/${pkgver}/frida-server-${pkgver}-android-x86_64.xz"
)
sha256sums=('5ea1544b51a28bc823b03159190d4108f9fb4f4ef912389f5137c6d295e175b2'
            '1783f21f72baac89ab38a774bd2ba5f2b038cd58d41da2cd7229b584bc9bf6af'
            'ef33d80bc3004551c1a07d17868f2320e8dcd6031651ba422ade03c16f5923e6'
            '602b642e01ee29a6811560de51f38ba79d0a1e4c922bce09036adb55421c2d9a'
            'f860f56da0a47f0061673d7c65b8152055fbe292cfc93b5ba366fc3682ef91f8')

latestver() {
  gh api repos/frida/frida/releases/latest --jq '.tag_name'
}

package() {
  local abi

  install -Dm644 "${pkgname}-${pkgver}-COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  for abi in arm arm64 x86 x86_64; do
    install -Dm755 "frida-server-${pkgver}-android-${abi}" \
      "${pkgdir}/usr/share/frida-server/android/${abi}/frida-server"
  done
}
