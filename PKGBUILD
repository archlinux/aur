# Maintainer: Philip Abernethy <chais.z3r0@gmail.com>

pkgname=minecraft-server
pkgver=1.8.6
pkgrel=1
pkgdesc="Minecraft server unit files, script, and jar"
arch=(any)
url="http://minecraft.net/"
license=('custom')
depends=('java-runtime-headless' 'systemd' 'screen' 'expect')
conflicts=('minecraft-server-systemd' 'minecraft-canary')
options=(!strip emptydirs)
install=minecraft-server.install
backup=('etc/conf.d/minecraft')
source=(https://s3.amazonaws.com/Minecraft.Download/versions/${pkgver}/minecraft_server.${pkgver}.jar
        minecraftd
        minecraftd-diag
        minecraftd.service
		minecraftctl
		conf.minecraft)
noextract=("minecraft_server.${pkgver}.jar")  
sha256sums=('7fc66b2b54f0f4d65fdd6d6484a50f432c144ef02072d3435d5660f120f58e0d'
            '043101c29d4b4f9092cb93ef52168cfe3d16d49ff573136f4fbb45071a38a5d1'
            'de03317d02668bb71ec160fff497c7fbfe8b03ffff2950c6a0bcfb39f69cd214'
            '6eb4c085b8377712671445b891a3a2cf2a17cf7a7bea66be456a980c2b620e23'
            '472e06e1bd63838e88ace0bd2f971f72f2efd9e541cc0956599a44c324fd49ac'
            '738e10185df160d190a5f4f0226de110d67ba023877e4999a6d3ef41c9918ed6')

package() {
  install -Dm755 "${srcdir}/minecraftd" "${pkgdir}/usr/bin/minecraftd"
  install -Dm755 "${srcdir}/minecraftd-diag" "${pkgdir}/usr/bin/minecraftd-diag"
  install -Dm755 "${srcdir}/minecraftctl" "${pkgdir}/usr/bin/minecraftctl"
  
  install -Dm644 "${srcdir}/minecraft_server.${pkgver}".jar "${pkgdir}/srv/minecraft/minecraft_server.${pkgver}".jar
  ln -s "minecraft_server.${pkgver}.jar" "${pkgdir}/srv/minecraft/minecraft_server.jar"
  install -Dm644 "${srcdir}/minecraftd.service" "${pkgdir}/usr/lib/systemd/system/minecraftd.service"
  install -Dm644 "${srcdir}/conf.minecraft" "${pkgdir}/etc/conf.d/minecraft"

  install -d "${pkgdir}/srv/minecraft/backup"
}
