# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

pkgname=android-emulator
pkgver=36.4.9
pkgrel=1
pkgdesc='Google Android Emulator'
arch=('x86_64')
url='https://developer.android.com/studio/releases/emulator.html'
license=('custom')
depends=('dbus' 'expat' 'gcc-libs' 'glibc' 'libbsd' 'libice' 'libpng'
         'libpulse' 'libsm' 'libtiff' 'libx11' 'libxcb' 'libxext'
         'libxi' 'libxkbfile' 'nspr' 'nss' 'util-linux-libs' 'zlib')
install="${pkgname}.install"
source=('https://dl.google.com/android/repository/emulator-linux_x64-14788078.zip'
        "${pkgname}.sh"
        "${pkgname}.csh"
        'package.xml')
sha1sums=('62a18e9c3a180ec6e071abee7ee81923a5d0c392'
          '80c9b3ffc8865b5f8e55b1ffed36c08ee7a9d8ad'
          'e1485ef14463f275005cae43a0a1e43ce52354ca'
          'e008ff9c14e01ae465d7ea7de7c7af77b3158a54')

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
