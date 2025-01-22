# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='tencentcloud-sdk-python'
pkgver=3.0.1308
pkgrel=1
pkgdesc='Tencent Cloud API 3.0 SDK for Python'
url='https://github.com/TencentCloud/tencentcloud-sdk-python'

license=('Apache-2.0')
arch=('any')
depends=(python-requests python-urllib3 python-certifi)
makedepends=(git python-build python-installer python-setuptools python-wheel)
conflicts=()
source=(
  "tencentcloud-sdk-python-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('0092e8dd2da9f231d9e561fd3e7d7318592dab266fe6c185f6369bbf6f89519c')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH=${pkgdir}/usr/lib python -c "import tencentcloud"
}
