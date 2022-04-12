# Maintainer: Maksim Kurnosenko <asusx2@mail.ru>

pkgname=element-web-bin
pkgver=1.10.9
pkgrel=1
pkgdesc="Glossy Matrix collaboration client — web version (built files without electron dependencies)."
arch=(any)
url="https://github.com/vector-im/element-web"
license=(Apache)
makedepends=()
provides=(element-web)
conflicts=(element-web)
source=(element-web-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/element-v${pkgver}.tar.gz
        element-web-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/element-v${pkgver}.tar.gz.asc)
sha256sums=('48d319fc4b642c8cb54fe0b4f890c000d1c0ea1f1d338d1ef228c4ca044ce27a'
            'SKIP')
validpgpkeys=(712BFBEE92DCA45252DB17D7C7BE97EFA179B100) # Element Releases <releases@riot.im>

package() {
  cd element-v${pkgver}

  install -d "${pkgdir}"/{usr/share/webapps,etc/webapps}/element

  cp -r * "${pkgdir}"/usr/share/webapps/element/
  install -Dm644 config.sample.json -t "${pkgdir}"/etc/webapps/element/
  ln -s /etc/webapps/element/config.json "${pkgdir}"/usr/share/webapps/element/
  echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/element/version
}
