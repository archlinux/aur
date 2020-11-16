# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Greene <mgreene@securityinnovation.com>

_pkgname='solid'
pkgname="python-${_pkgname}"

pkgver=1.0.3
pkgrel=1
_commit_readme='9c7a308628b791b36b3bc3693caba60b587db2b3'

pkgdesc='Python interface to the OpenSCAD declarative geometry language'
arch=('any')
url='https://github.com/SolidCode/SolidPython'
_url_pypi='https://pypi.org/project/solidpython'
license=('GPL2')
depends=('python' 'python-euclid3' 'python-prettytable' 'python-pypng' 'python-regex')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}python/${_pkgname}python-${pkgver}.tar.gz"
        "${_pkgname}-readme-${_commit_readme}::${url}/raw/${_commit_readme}/README.rst")
sha256sums=('85c7e1cbe6bc532a0df1207ead1ff3d814c477641cb2c8874fc6cd6ba5bf717c'
            '911560bc58a0bb793ed0c3da4faa5258ab558afb79d8036280f50b1c0b3b25ff')

build() {
  cd "${_pkgname}python-${pkgver}"
  python setup.py build
}

package() {
  install -Dvm644 "${_pkgname}-readme-${_commit_readme}" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  cd "${_pkgname}python-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
