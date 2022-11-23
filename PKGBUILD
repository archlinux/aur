# Maintainer: Maksim Kurnosenko <asusx2@mail.ru>

pkgname=element-web-bin
pkgver=1.11.15
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
sha256sums=('2d2c73957b6693a75afee72c6262f42c19f073e085591bc213e81b6fc0050617'
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
