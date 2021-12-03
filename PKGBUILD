# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=easyeda-router
pkgver=0.8.11
pkgrel=4
pkgdesc="LCEDA/EasyEDA local auto router server for Linux."
arch=('x86_64')
url="https://docs.easyeda.com/en/PCB/Route/index.html#Local-Auto-Router"
#url="https://docs.easyeda.com/cn/PCB/Route/index.html#%E6%9C%AC%E5%9C%B0%E8%87%AA%E5%8A%A8%E5%B8%83%E7%BA%BF"
license=('unknown')
depends=('jre8-openjdk-headless')
source=(${pkgname}-${pkgver}.zip::"https://image.easyeda.com/files/easyeda-router-linux-x64-v${pkgver}.zip")
# source=(${pkgname}-${pkgver}.zip::"https://image.lceda.cn/files/easyeda-router-linux-x64-v${pkgver}.zip")
source+=("${pkgname}.sh"
         "${pkgname}.service")
sha256sums=('188c71abddc29abda5caab6e7ebb158c1baa45dfcec6e0e18f150a253cde1383'
            '0b08eca8fc84a2b5ec3fc34c0cbcd37fd22cd9d2687214e298c82486bd7b9c0a'
            '35e5e4a2b5b6ba80ce9d8f807e3ddcabe1020fe77600a4de6b72f74f8a4c0a53')

_install() {
  find $1 -type f -exec install -Dm644 {} ${pkgdir}/usr/share/java/${pkgname}/{} \;
}

package() {
  cd ${pkgname}-linux-x64-v${pkgver}

  # bin
  _install 'bin'

  # config
  _install 'config'

  # wrapper
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

  # systemd service
  install -Dm644 ${srcdir}/${pkgname}.service -t ${pkgdir}/usr/lib/systemd/system/
}

# vim: set sw=2 ts=2 et:
