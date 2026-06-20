# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=frida-server-android-bin
pkgver=17.15.1
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
            '8e5503fb6e7c4606ac41fed4a352b907004c5518df7b57d330afe55853f17cbf'
            'bf84aaf55f65e9c3375c7018f6bd69960d2b7e7fe8032bf2339a94ba03aebfec'
            '6e732f78a9768b62e0ea13f2c2ec222eb9f10c65518c6f317683c7b7d5070669'
            'e5119ca3c9f6c0e4f84a095ff75b6a61cbabc82e97ffe82faa4549429784608d')

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
