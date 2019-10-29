# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=uvicorn
pkgver=0.9.1
pkgrel=1
pkgdesc="The lightning-fast ASGI server."
arch=('any')
url="https://www.uvicorn.org/"
license=('BSD')
depends=(
  'python>=3.6'
  'python-click>=7.0'
  'python-h11>=0.8.0'
  'python-httptools>=0.0.13'
  'python-uvloop'
  'python-websockets>=8.0'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
  "https://github.com/encode/uvicorn/archive/${pkgver}.tar.gz"
)
sha256sums=(
  '86467803f7c73a8c05bf1640bdad2464830d74d20e0f156edd1bade64926c294'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
