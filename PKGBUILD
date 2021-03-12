# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Zhang.j.k <zhangjk67 at gmail dian com>
# vim: ts=2 sw=2 et:

pkgname=konsave
pkgver=1.1.6
pkgrel=1
pkgdesc="Save and apply your KDE Plasma customizations with just one command!"
url="https://github.com/Prayag2/${pkgname}"
depends=('python' 'python-pyaml')
makedepends=('python-setuptools-scm')
license=('GPL3')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('32985037590934e05877130ff4d07bb370da462d89daddc1e38c526bfd78dcd3')

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
  # workaround #2
  install -Dm644 konsave/conf.yaml "${pkgdir}/usr/lib/python3.9/site-packages/konsave/conf.yaml"
}
