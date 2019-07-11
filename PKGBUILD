# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=cohesion
_version=1.0.0
_sha256sum=abb5a88b70de96e7dfb65244cc13cff7e9c5edee5333175d5a7668ac7c742c6c

pkgname="python-${_name}"
pkgver="${_version}"
pkgrel=1
pkgdesc="A tool for measuring Python class cohesion."
arch=('any')
url="https://github.com/mschwager/cohesion"
license=('GPL')
depends=('python')
makedepends=('python' 'python-setuptools')
optdepends=(
  'flake8: Flake8 Support'
)
options=(!emptydirs)
source=(
  #"https://files.pythonhosted.org/packages/py2.py3/${_name:0:1}/${_name}/${_name}-${_version}-py2.py3-none-any.whl"
  "${url}/archive/${_version}.tar.gz"
)
sha256sums=(
  "${_sha256sum}"
)

build() {
  cd "${srcdir}/${_name}-${_version}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${_version}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
