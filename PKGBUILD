# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>

pkgname=geysermc-bin
pkgver=2.1.2.SNAPSHOT.340be2d
pkgrel=1
pkgdesc="Geyser is a bridge between Minecraft: Bedrock Edition and Minecraft: Java Edition, closing the gap from those wanting to play true cross-platform. Unofficial AUR version."
arch=('any')
url="https://github.com/GeyserMC/Geyser"
license=('MIT')
backup=('etc/geysermc/config.yml')
depends=('java-runtime')
source=("Geyser-Standalone.jar::https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone" "geysermc.service")
md5sums=('SKIP'
         '7043a1445d39f7ee753c9c1513472890')

pkgver () {
  cd "${srcdir}"
  echo "$(cat git.properties | grep version | cut -d= -f2).$(cat git.properties | grep id.abbrev | cut -d= -f2)" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
  mkdir -p "${pkgdir}/usr/share/geysermc"
  mkdir -p "${pkgdir}/etc/geysermc"
  install -Dm644 "${srcdir}/Geyser-Standalone.jar" "${pkgdir}/usr/share/geysermc/Geyser.jar"
  install -Dm644 "${srcdir}/config.yml" "${pkgdir}/etc/geysermc/config.yml"
  install -Dm644 "${srcdir}/geysermc.service" "${pkgdir}/usr/lib/systemd/system/geysermc.service"
  ln -s "/etc/geysermc/config.yml" "${pkgdir}/usr/share/geysermc/config.yml"
}
