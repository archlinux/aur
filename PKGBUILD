# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='krop'
pkgname="${_pkgname}-git"
pkgver=0.6.0.r0.gcdca681
pkgrel=1
pkgdesc='Simple graphical tool to crop the pages of PDF files'
arch=('x86_64')
url='https://github.com/arminstraub/krop'
license=('GPL3')
depends=('python' 'python-poppler-qt5' 'python-pypdf2' 'python-pyqt5')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
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
}

# vim: ts=2 sw=2 et:
