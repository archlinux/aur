# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

pkgname=android-emulator
pkgver=37.2.12
pkgrel=1
pkgdesc='Google Android Emulator'
arch=('x86_64')
url='https://developer.android.com/studio/releases/emulator.html'
license=('custom')
depends=('dbus' 'expat' 'gcc-libs' 'glibc' 'libbsd' 'libice' 'libpng'
         'libpulse' 'libsm' 'libtiff' 'libx11' 'libxcb' 'libxext'
         'libxi' 'libxkbfile' 'nspr' 'nss' 'util-linux-libs' 'zlib')
install="${pkgname}.install"
source=('https://dl.google.com/android/repository/emulator-linux_x64-16428233.zip'
        "${pkgname}.sh"
        "${pkgname}.csh"
        'package.xml')
sha1sums=('cd7362ea55dfb86a418958138dc396e74165dd01'
          '80c9b3ffc8865b5f8e55b1ffed36c08ee7a9d8ad'
          'e1485ef14463f275005cae43a0a1e43ce52354ca'
          'bf83f21b84eacba54cc71aa9952f3b80bafbed85')

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -Dm755 "${pkgname}.csh" "${pkgdir}/etc/profile.d/${pkgname}.csh"

  install -d "${pkgdir}/opt/android-sdk/"
  cp -a emulator "${pkgdir}/opt/android-sdk/"
  install -Dm755 'package.xml' "${pkgdir}/opt/android-sdk/emulator/package.xml"

  # Fix broken permissions
  chmod -R o=g "${pkgdir}/opt/android-sdk/emulator"
  find "${pkgdir}/opt/android-sdk/emulator" -perm 744 -exec chmod 755 {} +
}

# getver: https://developer.android.com/studio/releases/emulator.html
# see https://dl.google.com/android/repository/repository2-1.xml for new versions
# vim:set ts=2 sw=2 et:
