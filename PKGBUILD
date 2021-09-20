# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=easyeda-router
pkgver=0.8.11
pkgrel=2
pkgdesc="LCEDA/EasyEDA local auto router server for Linux."
arch=('x86_64')
url="https://docs.easyeda.com/en/PCB/Route/index.html#Local-Auto-Router"
#url="https://docs.easyeda.com/cn/PCB/Route/index.html#%E6%9C%AC%E5%9C%B0%E8%87%AA%E5%8A%A8%E5%B8%83%E7%BA%BF"
license=('unknown')
depends=('jre8-openjdk-headless')
source=(${pkgname}-${pkgver}.zip::"https://image.easyeda.com/files/EasyEDA-Router-v${pkgver}.zip")
# source=(${pkgname}-${pkgver}.zip::"https://image.lceda.cn/files/EasyEDA-Router-latest.zip")
source+=("${pkgname}.sh"
         "${pkgname}.service")
sha256sums=('c7d5e36f60e9ff47a2775cdd922151173012d45f44bc843afeed80d1fb0a7616'
            '1868c56d03b0ccd07d30b8e3756bf7550209092d2050c322c63860b9c8bf7ba5'
            '35e5e4a2b5b6ba80ce9d8f807e3ddcabe1020fe77600a4de6b72f74f8a4c0a53')

_install() {
  cd ${srcdir}

  find $1 -type f -exec install -Dm644 {} ${pkgdir}/usr/share/java/${pkgname}/{} \;
}

package() {
  # bin
  _install 'bin'

  # config
  _install 'config'

  # wrapper
  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

  # systemd service
  install -Dm644 ${pkgname}.service -t ${pkgdir}/usr/lib/systemd/system/
}

# vim: set sw=2 ts=2 et:
