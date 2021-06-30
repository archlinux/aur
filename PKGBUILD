# Maintainer: Mark Merritt <mark@marktmerritt.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-importlab
_name=${pkgname#python-}
pkgver=0.6.1
pkgrel=3
pkgdesc="A library to calculate python dependency graphs."
arch=('any')
url="https://github.com/google/importlab"
license=('APACHE')
depends=('python-networkx' 'python-six')
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
sha256sums=(
  "056503329df1ba8f6291a4b548042aa18620ad91d39388ba58044f0fd44ff83e"
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
