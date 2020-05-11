# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=uvicorn
pkgver=0.11.5
pkgrel=1
pkgdesc="The lightning-fast ASGI server."
arch=('any')
url="https://www.uvicorn.org/"
license=('BSD')
depends=(
  'python>=3.6'
  'python-click>=7.0'
  'python-click<8.0'
  'python-h11>=0.8'
  'python-h11<0.10'
  'python-httptools>=0.1.0'
  'python-httptools<0.2.0'
  'python-uvloop>=0.14.0'
  'python-websockets>=8.0'
  'python-websockets<9.0'
)
makedepends=('python-setuptools')
optdepends=(
  'python-watchdog>=0.6: watchdogreload support'
  'python-watchdog<0.7: watchdogreload support'
)
options=(!emptydirs)
source=(
  "https://github.com/encode/uvicorn/archive/${pkgver}.tar.gz"
)
sha256sums=(
  'be40828a1cdabbc9fccf90b2d846f866f2c5e846e3ef7f75101cb3c76e9fc2df'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # XXX Remove unused data files
  rm -f "${pkgdir}/usr/LICENSE.md"
}
