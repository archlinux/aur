# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>

pkgname=steamcmd
pkgver=latest
pkgrel=7
pkgdesc="Steam Command Line Tools"
arch=('i686' 'x86_64')
license=('LicenseRef-Steam-Subscriber-Agreement')
url=http://developer.valvesoftware.com/wiki/SteamCMD
source=(https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz steamcmd
	2026-04-20-LICENSE.txt)
sha256sums=('cebf0046bfd08cf45da6bc094ae47aa39ebf4155e5ede41373b579b8f1071e7c'
            '5d8683ec3c528045e11625105cd7060dadd2c9eecf5a6c41dc65790e67612e66'
            '2ea6eb367cee67bff2f47ed6483d74b7b7e041e5754893f7aca115cb290354fc')
install='steamcmd.install'
depends=('bash')
depends_x86_64=('lib32-glibc' 'lib32-gcc-libs'
		#Steamcmd now installs a linux64 available for use with STEAM_PLATFORM=linux64
		'glibc'
	)
depends_i686=('glibc' 'gcc-libs')

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
  install -D -m644 "${srcdir}/2026-04-20-LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
