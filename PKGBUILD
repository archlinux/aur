# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='tencentcloud-cli'
pkgver=3.0.1257.1
pkgrel=1
pkgdesc='Tencent Cloud API 3.0 Command Line Interface'
url='https://github.com/TencentCloud/tencentcloud-cli'

_execname='tccli'
license=('Apache-2.0')
arch=('any')
depends=(tencentcloud-sdk-python)
makedepends=(git python-build python-installer python-setuptools python-wheel python-hatchling)
conflicts=()
source=(
  "${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('d37924a09c38f843b740811ab2ea5932b60fab6c4ca993a56e38ace75204b161')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
  #complete -C 'tccli_completer' tccli
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
