# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='wireviz'
pkgname="${_pkgname}-git"
pkgver=0.2.r0.g55dfc28
pkgrel=2
pkgdesc='Easily document cables, wiring harnesses and connector pinouts'
arch=('any')
url='https://github.com/formatc1702/WireViz'
license=('GPL3')
depends=('python-graphviz' 'python-pillow' 'python-pyaml')
makedepends=('git' 'python-setuptools')
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
  install -Dvm644 'docs/'*.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -rfv 'examples' 'tutorial' "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
