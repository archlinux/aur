# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='tencentcloud-sdk-python'
pkgver=3.1.117
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
sha256sums=('c37809db70579506be73af3d44a50561723d20a96df9a992817b48db358fafe7')

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

