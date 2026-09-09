# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=frida-server-android-bin
pkgver=17.18.0
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
            'b406aaafcaeb6649944aea09a8645b7e4126cc0864c270db7e53f2528bf4423c'
            '77c2a4aadf6010c69766abea5b6a408c66f5e2da43b3f2c920cf75a5fa1ec7f5'
            '46888b9a3ece37cd219d1accf6c1ef30397974de143dd38455e2d76d9f407676'
            'c2bd76f2a26330f8d0c104d104cec7fe91a6f607dc930902ffeed68ba1a37b7b')

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
