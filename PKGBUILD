# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=importlab

pkgname=python-importlab
pkgver=0.5
pkgrel=1
pkgdesc="A library to calculate python dependency graphs."
arch=('any')
url="https://github.com/google/importlab"
license=('APACHE')
depends=('python-networkx' 'python-six')
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=(
  'https://files.pythonhosted.org/packages/6c/14/9081386bafaa5673b7d75063afe084d2c15ce837921e3bfb32281569081f/importlab-0.5.tar.gz'
  )
sha256sums=(
  'ab3a0bf77a326de577e3c7f643ec304f83fed93cb1056638560d832413d6e736'
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
