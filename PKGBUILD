# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Levente Polyak <anthraxx [at] archlinux [dot] org>

_pyname=colorclass
pkgname=('python2-colorclass')
pkgver=2.2.0
pkgrel=5
pkgdesc='Yet another ANSI color text library for colorful worry-free console applications, python2 version'
url='https://github.com/Robpol86/colorclass'
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-docopt')
replaces=('python2-colorclass<=2.2.0-4')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Robpol86/colorclass/archive/v${pkgver}.tar.gz)
sha512sums=('c627cdf6abdb5a60e9ecc1fb3b669898edc027fdc3f8cde31be2e10402ee308c2067fcd50d1228759e93fc58c521b7fc12e6b259233a17cf99f55cda26279fed')

prepare() {
  cd ${_pyname}-${pkgver}
  sed -i -e s/python/python2/g example.py
}

build() {
  cd ${_pyname}-${pkgver}
  python2 setup.py build
}

check() {
  cd ${_pyname}-${pkgver}
  py.test2
}

package() {
  cd ${_pyname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --prefix=/usr -O1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst example.py -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
