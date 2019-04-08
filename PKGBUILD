# Maintainer: Panagiotis Mavrogiorgos <pmav99 at gmail dot com>

pkgbase=python-pipx
pkgname=python-pipx
_name=pipx
pkgver=0.13.0.0
pkgrel=1
pkgdesc='Execute binaries from Python packages in isolated environments'
arch=('any')
url='https://github.com/cs01/pipx/'
license=('MIT')
makedepends=(python-setuptools)
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("https://github.com/cs01/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('022b5f9bffca10cc3fe0b3ba31d0635e69f73a3a8ed9602ec52a965f014b3362765a2e995311f18a9a2036150326ba90f29bf29fe54b441a68ed929e246b3b6c')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  #  export PYTHONPATH=build:${PYTHONPATH}
  #  py.test
  #python setup.py test
}

package_python-pipx() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  # docs
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 {CHANGELOG.md,README.md}
}
