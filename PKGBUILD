# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=googleapis-common-protos

pkgname=python-googleapis-common-protos
pkgver=1.5.6
pkgrel=1
pkgdesc="Common protobufs used in Google APIs"
arch=('any')
url="https://pypi.org/project/googleapis-common-protos/"
license=('APACHE')
depends=(
  'python-protobuf>=3.6.0'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/61/29/1549f61917eadd11650e42b78b4afcfe9cb467157af4510ab8cb59535f14/googleapis-common-protos-${pkgver}.tar.gz"
)
sha256sums=(
  '6de6de98e895f4266caefa768778533bdea98abbead6972d35c8a0f57409eea2'
)

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # XXX why is there no read permission for files under *.egg-info directory for others?
  chmod -R +r "${pkgdir}"
}
