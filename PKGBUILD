# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=wireviz
_pkgname=WireViz
pkgver=0.4
pkgrel=1
pkgdesc='Easily document cables, wiring harnesses and connector pinouts'
arch=('any')
url='https://github.com/formatc1702/WireViz'
license=('GPL3')
depends=('python-graphviz' 'python-pillow' 'python-pyaml')
makedepends=('git' 'python-setuptools')
source=("https://github.com/formatc1702/WireViz/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5e2d3b58cefcff44eb46209127502b27f9d327c0992442e6e093472e2c16fe39')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'docs/'*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -rfv 'examples' 'tutorial' "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
