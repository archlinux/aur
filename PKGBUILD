# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='johnnydep'
pkgname="${_pkgname}-git"
pkgver=1.6.r2.g4b09e91
pkgrel=2
pkgdesc='Display dependency tree of Python distribution'
arch=('any')
url='https://github.com/wimglenn/johnnydep'
_url_pypi='https://pypi.org/project/johnnydep'
license=('MIT')
depends=('python-anytree'
        'python-cachetools'
        'python-colorama'
        'python-distlib'
        'python-oyaml'
        'python-packaging'
        'python-pip'
        'python-pkginfo'
        'python-setuptools'
        'python-structlog'
        'python-tabulate'
        'python-toml'
        'python-wheel'
        'python-wimpy')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
