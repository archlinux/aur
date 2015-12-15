# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Sid Karunaratne <sid at karunaratne dot net>
pkgname=statsd
pkgver=0.7.2
pkgrel=1
pkgdesc="A network daemon for aggregating statistics"
arch=('any')
url="https://github.com/etsy/statsd"
license=('MIT')
depends=(nodejs)
source=("https://github.com/etsy/statsd/archive/v${pkgver}.tar.gz" 'statsd.service')
install=${pkgname}.install
sha256sums=('0d0d6b7596fe68ef7da0984e32ca988c21985bdab825d33043cede2d7b9076f2'
            '6ff6e9c3cb5d30c69cd42ace66c37cce015a4bca2f869c36f2640ee3ec879c30')

package() {
  mkdir -p "${pkgdir}/usr/share/licenses/statsd"
  mkdir -p "${pkgdir}/opt"
  cp "$srcdir/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/statsd"
  cp -a "$srcdir/${pkgname}-${pkgver}/" "${pkgdir}/opt/${pkgname}"
  rm -f "${pkgdir}/opt/${pkgname}/.gitignore"
  rm -f "${pkgdir}/opt/${pkgname}/.travis.yml"
  rm -f "${pkgdir}/opt/${pkgname}/run_tests.sh"
  rm -fr "${pkgdir}/opt/${pkgname}/debian"
  rm -fr "${pkgdir}/opt/${pkgname}/test"
  install -Dm 644 statsd.service "${pkgdir}/usr/lib/systemd/system/statsd.service"
}

