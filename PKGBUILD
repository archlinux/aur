# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=frida-server-android-bin
pkgver=17.24.1
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
            '88fb023e896583a1bbd8977581d3c2230cbee3f33c49686e01fed98a5ccd5908'
            'ee5f4df162b4749ab1338e11db6b3642d2e16a7883795e159b35c19d9c4dc062'
            '5ca7180d86359a66601c801c6c9608652477fe22dcecee91e905e66e37768148'
            'd157eb91a0ef771de65316ab119cd8111595d2881341a4a1f26d9691c0dac685')

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
