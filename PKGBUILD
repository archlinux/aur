# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>

pkgname=steamcmd
pkgver=latest
pkgrel=5
pkgdesc="Steam Command Line Tools"
arch=('i686' 'x86_64')
license=('LicenseRef-Steam-Subscriber-Agreement')
url=http://developer.valvesoftware.com/wiki/SteamCMD
source=(https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz steamcmd
	2024-04-02-LICENSE.txt)
sha256sums=('cebf0046bfd08cf45da6bc094ae47aa39ebf4155e5ede41373b579b8f1071e7c'
            '5d8683ec3c528045e11625105cd7060dadd2c9eecf5a6c41dc65790e67612e66'
            '97b770938a44e74f330d4ad38001566aaeb26611b5590469fae445d52ddff349')
install='steamcmd.install'
depends=('bash')
depends_x86_64=('lib32-gcc-libs' 'lib32-sdl2' 'lib32-dbus' 'lib32-glibc')
depends_i686=('gcc-libs' 'sdl2' 'dbus')

package() {
  # sh script
  install -D -m755 "${srcdir}/steamcmd" "${pkgdir}/usr/bin/steamcmd"

  # in base folder
  install -D -m755 "${srcdir}/steamcmd.sh" "${pkgdir}/usr/lib/steamcmd/steamcmd.sh"

  # in linux32 folder
  install -D -m755 "${srcdir}/linux32/crashhandler.so" "${pkgdir}/usr/lib/steamcmd/linux32/crashhandler.so"
  install -D -m755 "${srcdir}/linux32/libstdc++.so.6" "${pkgdir}/usr/lib/steamcmd/linux32/libstdc++.so.6"
  install -D -m755 "${srcdir}/linux32/steamcmd" "${pkgdir}/usr/lib/steamcmd/linux32/steamcmd"
  install -D -m755 "${srcdir}/linux32/steamerrorreporter" "${pkgdir}/usr/lib/steamcmd/linux32/steamerrorreporter"

  # Steam Subscriber Agreement License
  install -D -m644 "${srcdir}/2024-04-02-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/2024-04-02-LICENSE.txt"
}
