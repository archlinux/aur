# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Zhang.j.k <zhangjk67 at gmail dian com>
# vim: ts=2 sw=2 et:

pkgname=konsave
pkgver=2.1.2
pkgrel=1
pkgdesc="Save and apply your KDE Plasma customizations with just one command!"
url="https://github.com/Prayag2/${pkgname}"
depends=(
  'python'
  'python-pyaml'
)
makedepends=('python-setuptools-scm')
license=('GPL3')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('291d33e12b9e038257a44015948f8c823872888b12b37f3a2f388cc28d9374bff81f7316098a98f1b460cd8efe7d1f3521999939315487ff0033bac9eb47caea')

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
