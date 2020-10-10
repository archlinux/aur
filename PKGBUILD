# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='bookletimposer'
pkgname="${_pkgname}-git"
pkgver=0.3.r4.g85d66b7
pkgrel=1
pkgdesc='Achieve some basic imposition on PDF documents'
arch=('any')
url='https://kjo.herbesfolles.org/bookletimposer/'
_url_source='https://git.codecoop.org/kjo/bookletimposer'
license=('GPL3')
depends=('python-gobject' 'python-pypdf2')
makedepends=('git' 'pandoc' 'python-distutils-extra' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${_url_source}.git")
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
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
