# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=frida-server-android-bin
pkgver=17.26.1
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
            '1cb071dad2db2726dbde523cb1df0412b95534c05a259d47a7797b310f5661fc'
            '4d1f1ca7ef85322e4ecfb0630e9ccaac484a9e691d21e01469cfb04d7010142c'
            'fa2845ab341cd73ff960b55368509e5a0d11d7c38aa6944217df8fbd410bd169'
            'b51775e3e8f897800fd9bcd1a57cf27014b29436b08cac1ef2c157c4611fd04e')

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
