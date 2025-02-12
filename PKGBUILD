# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='tencentcloud-cli'
pkgver=3.0.1266.1
pkgrel=1
pkgdesc='Tencent Cloud API 3.0 Command Line Interface'
url='https://github.com/TencentCloud/tencentcloud-cli'

_execname='tccli'
license=('Apache-2.0')
arch=('any')
depends=(
  tencentcloud-sdk-python
  python
  python-six
  python-jmespath
)
optdepends=()
makedepends=(git python-build python-installer python-setuptools python-wheel python-hatchling)
conflicts=()
source=(
  "${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('0d80a8cd12f272f57055cbbf84c3c1b9790b6eddc544744614860830c9fe94a4')

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
