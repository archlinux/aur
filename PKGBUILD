# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='PBinCLI'
pkgname="${_pkgname,,}-git"
pkgver=0.3.1.r2.g94023a9
pkgrel=1
pkgdesc='Command line client for PrivateBin'
arch=('any')
url='https://github.com/r4sas/PBinCLI'
license=('MIT')
depends=('python' 'python-base58' 'python-requests' 'python-sjcl' 'python-pyaml' 'python-pycryptodome')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
source=("${_pkgname,,}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname,,}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname,,}"
  python setup.py build
}

package() {
  cd "${_pkgname,,}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname,,}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname,,}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
