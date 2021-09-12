# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Zhang.j.k <zhangjk67 at gmail dian com>
# vim: ts=2 sw=2 et:

pkgname=konsave
pkgver=2.1.0
pkgrel=1
pkgdesc="Save and apply your KDE Plasma customizations with just one command!"
url="https://github.com/Prayag2/${pkgname}"
depends=(python python-pyaml)
makedepends=(python-setuptools-scm)
license=(GPL3)
arch=(any)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=(caaa2cfbf6856f72c1fac839bebf36b9f3ad86624efb6b6d7d6d7ada744d7471)

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install \
    --root="${pkgdir}" \
    --optimize=1 \
    --skip-build

  # Copying configuration files
  _python_folder=$(python -c "import site; print(site.getsitepackages()[0])")
  install -Dm644 konsave/conf_kde.yaml "${pkgdir}/${_python_folder}/${pkgname}/conf_kde.yaml"
  install -Dm644 konsave/conf_other.yaml "${pkgdir}/${_python_folder}/${pkgname}/conf_other.yaml"
}
