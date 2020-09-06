# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='johnnydep'
pkgname="${_pkgname}-git"
pkgver=1.5.r0.ga4982b8
pkgrel=1
pkgdesc='Display dependency tree of Python distribution'
arch=('any')
url='https://github.com/wimglenn/johnnydep'
license=('MIT')
depends=('python'
        'python-anytree'
        'python-cachetools'
        'python-colorama'
        'python-distlib'
        'python-oyaml'
        'python-packaging'
        'python-pkginfo'
        'python-pip'
        'python-setuptools'
        'python-structlog'
        'python-tabulate'
        'python-toml'
        'python-wheel'
        'python-wimpy')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
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
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
