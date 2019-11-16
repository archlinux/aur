# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=googleapis-common-protos
_sha256sum=e61b8ed5e36b976b487c6e7b15f31bb10c7a0ca7bd5c0e837f4afab64b53a0c6

pkgname=python-googleapis-common-protos
pkgver=1.6.0
pkgrel=2
pkgdesc="Common protobufs used in Google APIs"
arch=('any')
url="https://pypi.org/project/googleapis-common-protos/"
license=('APACHE')
depends=(
  'python-protobuf>=3.6.0'
)
makedepends=('python-setuptools')
optdepends=(
  'python-grpcio>=1.0.0: for grpc support'
)
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  "${_sha256sum}"
)

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # XXX why is there no read permission for files under *.egg-info directory for others?
  chmod -R +r "${pkgdir}"
}
