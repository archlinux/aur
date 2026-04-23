# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='tencentcloud-sdk-python'
pkgver=3.1.84
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
sha256sums=('b001ea4945dc5b0795c6fb4a2720aa07f1293992f8abc69704a7ec0108c48700')

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

