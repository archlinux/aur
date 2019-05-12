# Maintainer: Panagiotis Mavrogiorgos <pmav99 at gmail dot com>

pkgbase=python-pipx
pkgname=python-pipx
_name=pipx
pkgver=0.13.1.1
pkgrel=1
pkgdesc='Execute binaries from Python packages in isolated environments'
arch=('any')
url='https://github.com/cs01/pipx/'
license=('MIT')
depends=('python-userpath')
makedepends=('python-setuptools')
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("https://github.com/cs01/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('bab31764c2978236eb8da153d6238686228862a0819babcf383ed7551aef2e53e38275c53b0bbf67b3f1e13658d67fa4ddde72ee1d0d7db7c6f6f52aaf72f7a7')

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
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

