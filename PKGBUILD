# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Zhang.j.k <zhangjk67 at gmail dian com>
# vim: ts=2 sw=2 et:

pkgname=konsave
pkgver=1.1.9
pkgrel=1
pkgdesc="Save and apply your KDE Plasma customizations with just one command!"
url="https://github.com/Prayag2/${pkgname}"
depends=('python' 'python-pyaml')
makedepends=('python-setuptools-scm')
license=('GPL3')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('527a7b7ed62097a5ce44c7f86ca6382ab2eda00263257b725d7872512db4d4a6')

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
