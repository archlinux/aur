# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=importlab
_sha256sum=d855350d19dc10a17aabd2fe6f4b428ff1a936071f692fbf686a73694d26a51c

pkgname=python-importlab
pkgver=0.5.1
pkgrel=1
pkgdesc="A library to calculate python dependency graphs."
arch=('any')
url="https://github.com/google/importlab"
license=('APACHE')
depends=('python-networkx' 'python-six')
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  "${_sha256sum}"
)

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  # Fix permissions
  chmod -R +r *
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 CHANGELOG "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
