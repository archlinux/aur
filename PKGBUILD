# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Zhang.j.k <zhangjk67 at gmail dian com>
# vim: ts=2 sw=2 et:

pkgname=konsave
pkgver=1.1.8
pkgrel=1
pkgdesc="Save and apply your KDE Plasma customizations with just one command!"
url="https://github.com/Prayag2/${pkgname}"
depends=('python' 'python-pyaml')
makedepends=('python-setuptools-scm')
license=('GPL3')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('576c466f476f27a6f75cbc297e6ea4c5eabd76a90edb47f006b758d0da483646')

prepare() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 konsave/conf.yaml "${pkgdir}/usr/lib/python3.9/site-packages/konsave/conf.yaml"
}
