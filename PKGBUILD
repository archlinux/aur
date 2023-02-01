# Maintainer: Maksim Kurnosenko <asusx2@mail.ru>

pkgname=element-web-bin
pkgver=1.11.22
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
sha256sums=('026746e75d84854d1729baee6c8c70826be5e59f85917f9055b24be1027fae00'
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
