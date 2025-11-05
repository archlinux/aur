# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>

pkgname=geysermc-bin
pkgver=2.9.0.b979.73e67fc
pkgrel=1
pkgdesc="Geyser is a bridge between Minecraft: Bedrock Edition and Minecraft: Java Edition, closing the gap from those wanting to play true cross-platform. Unofficial AUR version."
arch=('any')
url="https://github.com/GeyserMC/Geyser"
license=('MIT')
backup=('etc/geysermc/config.yml')
depends=('java-runtime')
source=("Geyser-Standalone.jar::https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone"
        'LICENSE.geysermc::https://github.com/GeyserMC/Geyser/raw/refs/heads/master/LICENSE' 'geysermc.service')
md5sums=('SKIP'
         'd87a7cfc78cfb45f6f4827b263e3e0a0'
         '7043a1445d39f7ee753c9c1513472890')

pkgver () {
  cd "${srcdir}"
  echo "$(cat git.properties | grep version | cut -d= -f2 | cut -d' ' -f1).$(cat git.properties | grep id.abbrev | cut -d= -f2)" | sed 's/-/./g'
}

package () {
  mkdir -p "${pkgdir}/usr/share/geysermc"
  mkdir -p "${pkgdir}/etc/geysermc"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/Geyser-Standalone.jar" "${pkgdir}/usr/share/geysermc/Geyser.jar"
  install -Dm644 "${srcdir}/config.yml" "${pkgdir}/etc/geysermc/config.yml"
  install -Dm644 "${srcdir}/geysermc.service" "${pkgdir}/usr/lib/systemd/system/geysermc.service"
  install -Dm644 "${srcdir}/LICENSE.geysermc" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s "/etc/geysermc/config.yml" "${pkgdir}/usr/share/geysermc/config.yml"
}
