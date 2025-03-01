# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='tencentcloud-sdk-python'
pkgver=3.0.1329
pkgrel=1
pkgdesc='Tencent Cloud API 3.0 SDK for Python'
url='https://github.com/TencentCloud/tencentcloud-sdk-python'

license=('Apache-2.0')
arch=('any')
depends=(python python-requests python-urllib3 python-certifi)
makedepends=(git python-build python-installer python-setuptools python-wheel)
conflicts=()
source=(
  "${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('dad4aa0172054616556503d5b35002018319c0e03ef3f2c325379ccdc4ba9bfb')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH=${pkgdir}/src python -c "import tencentcloud"
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

