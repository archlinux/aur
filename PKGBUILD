# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Zhang.j.k <zhangjk67 at gmail dian com>
# vim: ts=2 sw=2 et:

pkgname=konsave
pkgver=1.1.7
pkgrel=1
pkgdesc="Save and apply your KDE Plasma customizations with just one command!"
url="https://github.com/Prayag2/${pkgname}"
depends=('python' 'python-pyaml')
makedepends=('python-setuptools-scm')
license=('GPL3')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e8e1f6fa08b1d037cd0f9b2212463624f692b412ca043018449342b3d32b38f5')

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
  # workaround
  install -Dm644 konsave/conf.yaml "${pkgdir}/usr/lib/python3.9/site-packages/konsave/conf.yaml"
}
