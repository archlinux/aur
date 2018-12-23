# Maintainer: Panagiotis Mavrogiorgos <pmav99 at gmail dot com>

pkgbase=python-pipx
pkgname=python-pipx
_name=pipx
pkgver=0.10.4.1
pkgrel=1
pkgdesc='Execute binaries from Python packages in isolated environments'
arch=('any')
url='https://github.com/cs01/pipx/'
license=('MIT')
makedepends=(python-setuptools)
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("https://github.com/cs01/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('8cb4cf9c907bf3a2e602bd3edcb20f2887bc32c8324140b85a80433a26b1dd5231a6d300c65957ffc9d6b892cf334736e477441265fe4ca3a7e2fa4bb0b8b449')

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
