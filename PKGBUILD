# Maintainer: Maksim Kurnosenko <asusx2@mail.ru>

pkgname=element-web-bin
pkgver=1.10.4
pkgrel=1
pkgdesc="Glossy Matrix collaboration client — web version (built files without electron dependencies)."
arch=(any)
url="https://element.io"
license=(Apache)
makedepends=()
provides=(element-web)
conflicts=(element-web)
_url="https://github.com/vector-im/element"
source=(element-web-${pkgver}.tar.gz::${_url}-web/releases/download/v${pkgver}/element-v${pkgver}.tar.gz
        element-web-${pkgver}.tar.gz.asc::${_url}-web/releases/download/v${pkgver}/element-v${pkgver}.tar.gz.asc)
sha256sums=('74d44bbbd59fc25675c179d1a5350a0b092b4f9a0abec012ae8df4d5dab5c86d'
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
