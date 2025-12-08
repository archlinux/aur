# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgauthor=Jeffail
_pkgname=leaps
pkgname=${_pkgname}-bin
pkgver=0.9.0
pkgrel=2
pkgdesc="A service for collaboratively editing your local files over a web UI, using operational transforms to ensure zero-collision synchronization across any number of editing clients"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${pkgname}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm7.tar.gz")
sha256sums=('d99e66b5a0878e428224b79a363078ad9c5d3c5545c881b6fc9fecb23d15c7db'
            'f390663c01753937158259662b902c2c9c4f561fe507491cf99cd17736efacd5')
sha256sums_x86_64=('81a4dbb42fecf25b6728ba6ebc1225bb2e65ae949e8d0827e629c95acd463765')
sha256sums_aarch64=('30789fd06fd4cc2d7415c04ce591d97d3e277380f9766896c61556722b4fc05a')

_dir() {
  case ${CARCH} in
    ${arch[0]})
      echo "amd64"
      ;;
    ${arch[1]})
      echo "arm7"
      ;;
  esac
}

package() {
  cd "${srcdir}" || exit

  dir=$(_dir)
  install -Dm755 "${_pkgname}_linux_${dir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
